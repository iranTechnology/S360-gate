<?php

/** Passenger-level cancellation of reservation tours; refunds are entered by the operator. */
class tourCancellation extends baseController
{
    private $db;
    private $report;

    public function __construct($db = null, $report = null)
    {
        $this->db = $db ?: Load::library('Model')->getPDO();
        $this->report = $report;
    }

    private function query($sql, array $values = [], $connection = null)
    {
        $statement = ($connection ?: $this->db)->prepare($sql);
        $statement->execute($values);
        return $statement;
    }

    private function transaction($operation, $withReport = false)
    {
        try {
            if ($withReport && !$this->report) {
                $this->report = Load::library('ModelBase')->getPDO();
            }
            $this->db->beginTransaction();
            if ($withReport && $this->report !== $this->db) {
                $this->report->beginTransaction();
            }
            $result = $operation();
            if ($withReport && $this->report !== $this->db) {
                $this->report->commit();
            }
            $this->db->commit();
            return $result;
        } catch (Throwable $error) {
            if ($withReport && $this->report && $this->report !== $this->db && $this->report->inTransaction()) {
                $this->report->rollBack();
            }
            if ($this->db->inTransaction()) {
                $this->db->rollBack();
            }
            return 'error : ' . ($error instanceof InvalidArgumentException ? $error->getMessage() : 'خطا در ثبت کنسلی تور؛ لطفاً دوباره تلاش کنید');
        }
    }

    public function availablePassengers($factorNumber, $memberId)
    {
        return $this->query("SELECT book.* FROM book_tour_local_tb book
            WHERE book.factor_number = ? AND book.member_id = ?
              AND book.status = 'BookedSuccessfully'
              AND COALESCE(book.request_cancel, '') <> 'confirm'
              AND NOT EXISTS (
                SELECT 1 FROM cancel_ticket_details_tb detail
                JOIN cancel_ticket_tb passenger ON passenger.IdDetail = detail.id
                WHERE detail.FactorNumber = book.factor_number AND detail.TypeCancel = 'tour'
                  AND detail.Status <> 'SetCancelClient'
                  AND (passenger.NationalCode = CONCAT('tourPassenger:', book.id)
                    OR passenger.NationalCode = book.factor_number
                    OR (book.passenger_national_code <> '' AND passenger.NationalCode = book.passenger_national_code)
                    OR (book.passportNumber <> '' AND passenger.NationalCode = book.passportNumber)))
            ORDER BY book.id", [$factorNumber, $memberId])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function request(array $params, $memberId)
    {
        return $this->transaction(function () use ($params, $memberId) {
            $factor = isset($params['FactorNumber']) ? $params['FactorNumber'] : '';
            $ids = isset($params['passengerIds']) && is_array($params['passengerIds']) ? $params['passengerIds'] : [];
            if (!$memberId || !$ids || !ctype_digit((string) $factor)) {
                throw new InvalidArgumentException('لطفاً مسافران مورد نظر را انتخاب کنید');
            }
            foreach ($ids as $id) {
                if (!ctype_digit((string) $id) || (int) $id < 1) {
                    throw new InvalidArgumentException('مسافر انتخاب‌شده معتبر نیست');
                }
            }
            $ids = array_values(array_unique(array_map('intval', $ids)));
            // Lock all passengers in the order to serialize concurrent cancellation requests.
            $this->query('SELECT id FROM book_tour_local_tb WHERE factor_number = ? AND member_id = ? FOR UPDATE', [$factor, $memberId])->fetchAll();
            $available = array_column($this->availablePassengers($factor, $memberId), 'id');
            if (array_diff($ids, $available)) {
                throw new InvalidArgumentException('درخواست کنسلی این مسافران قبلاً ثبت شده یا مجاز نیست');
            }
            $credit = isset($params['backCredit']) && $params['backCredit'] === 'on';
            $comment = trim(isset($params['commentUser']) ? $params['commentUser'] : '');
            if ($comment === '' || (!$credit && (empty($params['CardNumber']) || empty($params['AccountOwner']) || empty($params['NameBank'])))) {
                throw new InvalidArgumentException('لطفاً اطلاعات لازم برای استرداد را تکمیل کنید');
            }
            $this->query("INSERT INTO cancel_ticket_details_tb
                (MemberId, TypeCancel, FactorNumber, RequestNumber, Status, backCredit, confirmTransferWallet,
                 AccountOwner, CardNumber, NameBank, comment_user, DateRequestMemberInt,
                 PercentIndemnity, PriceIndemnity, PercentNoMatter)
                VALUES (?, 'tour', ?, ?, 'RequestMember', ?, 'none', ?, ?, ?, ?, ?, 0, 0, 'No')",
                [$memberId, $factor, $factor, $credit ? 'on' : '',
                 isset($params['AccountOwner']) ? $params['AccountOwner'] : '',
                 isset($params['CardNumber']) ? $params['CardNumber'] : '',
                 isset($params['NameBank']) ? $params['NameBank'] : '', $comment, time()]);
            $detailId = $this->db->lastInsertId();
            foreach ($ids as $id) {
                $this->query('INSERT INTO cancel_ticket_tb (IdDetail, NationalCode) VALUES (?, ?)', [$detailId, 'tourPassenger:' . $id]);
            }
            return 'success : درخواست کنسلی مسافران انتخاب‌شده ثبت شد';
        });
    }

    public function summary($factorNumber, $memberId)
    {
        return $this->query("SELECT COUNT(*) AS total,
            SUM(status = 'Cancellation') AS cancelled,
            CASE WHEN SUM(status = 'BookedSuccessfully') > 0 THEN 'BookedSuccessfully'
                 WHEN SUM(status = 'PreReserve') > 0 THEN 'PreReserve'
                 WHEN SUM(status = 'Cancellation') = COUNT(*) THEN 'Cancellation'
                 ELSE MAX(status) END AS status
            FROM book_tour_local_tb WHERE factor_number = ? AND member_id = ?",
            [$factorNumber, $memberId])->fetch(PDO::FETCH_ASSOC);
    }

    public function requestNotices($factorNumber, $memberId)
    {
        $requests = $this->query("SELECT id, Status, DescriptionClient FROM cancel_ticket_details_tb
            WHERE FactorNumber = ? AND MemberId = ? AND TypeCancel = 'tour'
              AND Status IN ('RequestMember', 'SetCancelClient')
            ORDER BY id DESC", [$factorNumber, $memberId])->fetchAll(PDO::FETCH_ASSOC);
        $html = '';
        foreach ($requests as $request) {
            $number = (int) $request['id'];
            if ($request['Status'] === 'RequestMember') {
                $html .= '<div class="mt-2 text-warning">درخواست کنسلی  در دست بررسی است</div>';
            } else {
                $reason = trim((string) $request['DescriptionClient']);
                $html .= '<details class="mt-2 text-danger"><summary>درخواست کنسلی رد شد؛ مشاهده علت</summary><div class="mt-1">'
                    . nl2br(htmlspecialchars($reason !== '' ? $reason : 'علت رد درخواست ثبت نشده است.', ENT_QUOTES, 'UTF-8'))
                    . '</div></details>';
            }
        }
        return $html;
    }

    public function adminOverview($factorNumber, $memberId)
    {
        $summary = $this->summary($factorNumber, $memberId);
        $passengers = $this->query("SELECT book.*,
            EXISTS (SELECT 1 FROM cancel_ticket_details_tb detail
                JOIN cancel_ticket_tb passenger ON passenger.IdDetail = detail.id
                WHERE detail.FactorNumber = book.factor_number AND detail.MemberId = book.member_id
                  AND detail.TypeCancel = 'tour' AND detail.Status = 'RequestMember'
                  AND (passenger.NationalCode = CONCAT('tourPassenger:', book.id)
                    OR passenger.NationalCode = book.factor_number
                    OR (book.passenger_national_code <> '' AND passenger.NationalCode = book.passenger_national_code)
                    OR (book.passportNumber <> '' AND passenger.NationalCode = book.passportNumber))) AS cancellation_pending
            FROM book_tour_local_tb book WHERE book.factor_number = ? AND book.member_id = ? ORDER BY book.id",
            [$factorNumber, $memberId])->fetchAll(PDO::FETCH_ASSOC);
        $pending = 0;
        $rows = '';
        foreach ($passengers as $passenger) {
            $pending += (int) $passenger['cancellation_pending'];
            $name = trim($passenger['passenger_name'] . ' ' . $passenger['passenger_family']);
            if ($name === '') {
                $name = trim($passenger['passenger_name_en'] . ' ' . $passenger['passenger_family_en']);
            }
            $identifier = $passenger['passenger_national_code'] ?: $passenger['passportNumber'];
            $label = $passenger['status'] === 'Cancellation' ? 'کنسل شده' : ($passenger['cancellation_pending'] ? 'کنسلی در دست بررسی' : 'بدون کنسلی');
            $rows .= '<li>' . htmlspecialchars($name . ($identifier ? ' (' . $identifier . ')' : ''), ENT_QUOTES, 'UTF-8')
                . ' — ' . $label . '</li>';
        }
        $html = '';
        if ($summary['cancelled'] || $pending) {
            $html = '<div class="mt-2">کنسل شده: ' . (int) $summary['cancelled'] . ' از ' . (int) $summary['total']
                . ' نفر؛ در دست بررسی: ' . $pending . ' نفر</div><details><summary>مشاهده وضعیت مسافران</summary><ul>' . $rows . '</ul></details>';
        }
        return ['status' => $summary['status'], 'html' => $html];
    }

    private function detail($id, $factor, $lock = false)
    {
        $detail = $this->query("SELECT * FROM cancel_ticket_details_tb WHERE id = ? AND RequestNumber = ? AND TypeCancel = 'tour'" . ($lock ? ' FOR UPDATE' : ''), [$id, $factor])->fetch(PDO::FETCH_ASSOC);
        if (!$detail) {
            throw new InvalidArgumentException('درخواست کنسلی تور معتبر نیست');
        }
        return $detail;
    }

    public function isTourRequest($id, $factor = null)
    {
        $sql = "SELECT id FROM cancel_ticket_details_tb WHERE id = ? AND TypeCancel = 'tour'";
        $values = [$id];
        if ($factor !== null) {
            $sql .= ' AND RequestNumber = ?';
            $values[] = $factor;
        }
        return (bool) $this->query($sql, $values)->fetchColumn();
    }

    private function requireOperator()
    {
        if (!Session::adminIsLogin() && !Session::CheckAgencyPartnerLoginToAdmin()) {
            throw new InvalidArgumentException('دسترسی به عملیات مدیریت کنسلی مجاز نیست');
        }
    }

    public function reject(array $params)
    {
        return $this->transaction(function () use ($params) {
            $this->requireOperator();
            $detail = $this->detail($params['id'], $params['RequestNumber'], true);
            if ($detail['Status'] !== 'RequestMember') {
                throw new InvalidArgumentException('این درخواست قبلاً بررسی شده است');
            }
            $reason = isset($params['DescriptionClient']) ? trim((string) $params['DescriptionClient']) : '';
            if ($reason === '') {
                throw new InvalidArgumentException('علت رد درخواست کنسلی را وارد کنید');
            }
            $this->query("UPDATE cancel_ticket_details_tb SET Status = 'SetCancelClient', DescriptionClient = ?, DateSetCancelInt = ? WHERE id = ?",
                [$reason, time(), $detail['id']]);
            return 'success : درخواست کنسلی رد شد';
        });
    }

    public function approve(array $params)
    {
        return $this->transaction(function () use ($params) {
            $this->requireOperator();
            $detail = $this->detail($params['id'], $params['RequestNumber'], true);
            if ($detail['Status'] !== 'RequestMember') {
                throw new InvalidArgumentException('این درخواست قبلاً بررسی شده است');
            }
            $percent = isset($params['PercentIndemnity']) ? $params['PercentIndemnity'] : '';
            if (!is_numeric($percent) || $percent < 0 || $percent > 100) {
                throw new InvalidArgumentException('درصد جریمه باید بین صفر و صد باشد');
            }
            $passengers = $this->query("SELECT DISTINCT book.* FROM book_tour_local_tb book
                JOIN cancel_ticket_tb selected ON selected.IdDetail = ?
                  AND (selected.NationalCode = CONCAT('tourPassenger:', book.id)
                    OR selected.NationalCode = book.factor_number
                    OR (book.passenger_national_code <> '' AND selected.NationalCode = book.passenger_national_code)
                    OR (book.passportNumber <> '' AND selected.NationalCode = book.passportNumber))
                WHERE book.factor_number = ? AND book.member_id = ? FOR UPDATE",
                [$detail['id'], $detail['FactorNumber'], $detail['MemberId']])->fetchAll(PDO::FETCH_ASSOC);
            if (!$passengers) {
                throw new InvalidArgumentException('مسافران این درخواست یافت نشدند');
            }
            foreach ($passengers as $passenger) {
                if ($passenger['status'] !== 'BookedSuccessfully' || $passenger['request_cancel'] === 'confirm') {
                    throw new InvalidArgumentException('مسافر قبلاً کنسل شده یا قابل کنسلی نیست');
                }
            }
            // Report identifiers can differ from the client's booking identifiers.
            foreach ($passengers as $passenger) {
                $reports = $this->query("SELECT id FROM report_tour_tb WHERE factor_number = ?
                    AND passenger_national_code <=> ? AND passportNumber <=> ?
                    AND passenger_name <=> ? AND passenger_family <=> ?
                    AND passenger_name_en <=> ? AND passenger_family_en <=> ?",
                    [$detail['FactorNumber'], $passenger['passenger_national_code'], $passenger['passportNumber'],
                     $passenger['passenger_name'], $passenger['passenger_family'],
                     $passenger['passenger_name_en'], $passenger['passenger_family_en']], $this->report)->fetchAll(PDO::FETCH_ASSOC);
                if (count($reports) !== 1) {
                    throw new InvalidArgumentException('تطبیق مسافر با گزارش تور ممکن نیست؛ اطلاعات مسافر باید بررسی شود');
                }
                $this->query("UPDATE report_tour_tb SET status = 'Cancellation', request_cancel = 'confirm', cancellation_comment = ? WHERE id = ?",
                    [isset($params['DescriptionAdmin']) ? $params['DescriptionAdmin'] : '', $reports[0]['id']], $this->report);
                $this->query("UPDATE book_tour_local_tb SET status = 'Cancellation', request_cancel = 'confirm', cancellation_comment = ? WHERE id = ?",
                    [isset($params['DescriptionAdmin']) ? $params['DescriptionAdmin'] : '', $passenger['id']]);
            }
            $this->query("UPDATE cancel_ticket_details_tb SET Status = 'ConfirmCancel', PercentIndemnity = ?,
                DescriptionAdmin = ?, DateSetIndemnityInt = ?, DateConfirmCancelInt = ? WHERE id = ?",
                [$percent, isset($params['DescriptionAdmin']) ? $params['DescriptionAdmin'] : '', time(), time(), $detail['id']]);
            return 'success : کنسلی مسافران انتخاب‌شده تأیید شد';
        }, true);
    }

    public function refund(array $params, $method)
    {
        return $this->transaction(function () use ($params, $method) {
            $this->requireOperator();
            if (!in_array($method, ['wallet', 'bank'], true)) {
                throw new InvalidArgumentException('روش استرداد معتبر نیست');
            }
            $detail = $this->detail($params['ParamId'], $params['RequestNumber'], true);
            if ($detail['Status'] !== 'ConfirmCancel' || $detail['confirmTransferWallet'] !== 'none' || (string) $detail['MemberId'] !== (string) $params['ClientID']) {
                throw new InvalidArgumentException('درخواست هنوز تأیید نشده یا وجه آن قبلاً بازگردانده شده است');
            }
            $amount = isset($params['priceBack']) ? str_replace(',', '', $params['priceBack']) : '';
            if ($method === 'bank' && $amount === '') {
                $amount = (string) $detail['PriceIndemnity'];
            }
            if (!ctype_digit((string) $amount)) {
                throw new InvalidArgumentException('مبلغ استرداد باید عدد غیرمنفی باشد');
            }
            if ($method === 'wallet') {
                $member = $this->query('SELECT fk_counter_type_id, fk_agency_id FROM members_tb WHERE id = ? FOR UPDATE', [$detail['MemberId']])->fetch(PDO::FETCH_ASSOC);
                if (!$member) {
                    throw new InvalidArgumentException('کاربر درخواست‌کننده یافت نشد');
                }
                if ((int) $member['fk_counter_type_id'] !== 5) {
                    $agency = $this->query('SELECT id FROM agency_tb WHERE id = ? FOR UPDATE', [$member['fk_agency_id']])->fetchColumn();
                    if (!$agency) {
                        throw new InvalidArgumentException('همکار مرتبط با کانتر یافت نشد');
                    }
                    $this->query("INSERT INTO credit_detail_tb
                        (fk_agency_id, credit, type, credit_date, reason, member_id, requestNumber, factorNumber, comment, creation_date_int, PaymentStatus)
                        VALUES (?, ?, 'increase', ?, 'buy', ?, ?, ?, ?, ?, 'success')",
                        [$agency, $amount, dateTimeSetting::jdate('Y-m-d', time()), $detail['MemberId'], $detail['FactorNumber'],
                            'TourRefund-' . $detail['id'], 'استرداد تور به شماره فاکتور ' . $detail['FactorNumber'], time()]);
                    $this->query("UPDATE cancel_ticket_details_tb SET confirmTransferWallet = 'ReturnWalletCounter', PriceIndemnity = ?, DateConfirmClientInt = ? WHERE id = ?", [$amount, time(), $detail['id']]);
                    return 'Success : مبلغ به اعتبار همکار مرتبط با کانتر بازگردانده شد';
                }
                $this->query("INSERT INTO members_credit_tb
                    (memberId, amount, factorNumber, state, reason, comment, status, creationDateInt)
                    VALUES (?, ?, ?, 'charge', 'increase', ?, 'success', ?)",
                    [$detail['MemberId'], $amount, 'TourRefund-' . $detail['id'], 'استرداد تور به شماره فاکتور ' . $detail['FactorNumber'], time()]);
                $this->query("UPDATE cancel_ticket_details_tb SET confirmTransferWallet = 'ReturnWallet', PriceIndemnity = ?, DateConfirmClientInt = ? WHERE id = ?", [$amount, time(), $detail['id']]);
                return 'Success : مبلغ به کیف پول کاربر بازگردانده شد';
            }
            $this->query("UPDATE cancel_ticket_details_tb SET confirmTransferWallet = 'ReturnBankCart', PriceIndemnity = ?, DateConfirmClientInt = ? WHERE id = ?", [$amount, time(), $detail['id']]);
            return 'success : بازگشت وجه به حساب بانکی تأیید شد';
        });
    }
}
