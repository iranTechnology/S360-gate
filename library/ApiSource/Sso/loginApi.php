<?php


/**
 * Class api
 * @property loginApi $loginApi
 */

class loginApi extends clientAuth
{

    private $content;

    public function __construct()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && (strpos($_SERVER['CONTENT_TYPE'], 'application/json') !== false)) {
            $this->content = json_decode(file_get_contents('php://input'), true);

            if (isset($this->content['userName']) && !empty($this->content['userName'])) {
                $userName = filter_var($this->content['userName'], FILTER_SANITIZE_STRING);
                $key = filter_var($this->content['key'], FILTER_SANITIZE_STRING);
                $ModelBase = Load::library('ModelBase');
                $Sql = "SELECT * FROM client_user_api WHERE userName='{$userName}' AND keyTabdol='{$key}'  AND is_enable='1'";
                $resClient = $ModelBase->load($Sql);

                if (!empty($resClient)) {
                    $SqlClientAuth = "SELECT * FROM client_auth_tb WHERE ClientId='{$resClient['clientId']}' AND SourceId='1' AND serviceId='1' AND IsActive='Active'";
                    $resClientAuth = $ModelBase->load($SqlClientAuth);

                    if (!empty($resClientAuth)) {
                        unset($this->content['key']);
                        if (empty($this->content['mobile'])) {
                            $infoCode = array(
                                'Result' => array(
                                    'Value' => ''
                                ),
                                'RequestStatus' => 'Error',
                                'Message' => 'mobile is required',
                                'MessageCode' => 'E0User',
                                'Code' => ''
                            );
                            echo json_encode($infoCode);
                            exit;
                        }
                        elseif (empty($this->content['firstName'])) {
                            $infoCode = array(
                                'Result' => array(
                                    'Value' => ''
                                ),
                                'RequestStatus' => 'Error',
                                'Message' => 'firstName is required',
                                'MessageCode' => 'E0User',
                                'Code' => ''
                            );
                            echo json_encode($infoCode);
                            exit;
                        }
                        elseif (empty($this->content['lastName'])) {
                            $infoCode = array(
                                'Result' => array(
                                    'Value' => ''
                                ),
                                'RequestStatus' => 'Error',
                                'Message' => 'lastName is required',
                                'MessageCode' => 'E0User',
                                'Code' => ''
                            );
                            echo json_encode($infoCode);
                            exit;
                        }
                        elseif (empty($this->content['password'])) {
                            $infoCode = array(
                                'Result' => array(
                                    'Value' => ''
                                ),
                                'RequestStatus' => 'Error',
                                'Message' => 'password is required',
                                'MessageCode' => 'E0User',
                                'Code' => ''
                            );
                            echo json_encode($infoCode);
                            exit;
                        }

                        $mock_fields = [
                            "given_name" => $this->content['firstName'],
                            "family_name" => $this->content['lastName'],
                            "email" => $this->content['email'],
                            "Mobile" => $this->content['mobile'],
                            "password" => $this->content['password']
                        ];

                        $response = $this->mock_connect_token($mock_fields);


                        $data = $response;

                        $userInfo = [];
                        if (isset($data['id_token'])) {
                            $parts = explode('.', $data['id_token']);
                            $payload_b64 = $parts[1];
                            $payload_b64 .= str_repeat('=', 4 - (strlen($payload_b64) % 4)); // padding

                            $payload_json = base64_decode(strtr($payload_b64, '-_', '+/'));
                            $userInfo = $payload_json;
                        }
                        elseif (isset($data['user_info'])) {
                            $userInfo = $data['user_info'];
                        }
                        else {
                            $possible = ['given_name', 'family_name', 'firstname', 'lastname', 'mobile', 'Mobile', 'email'];
                            foreach ($possible as $k) if (isset($data[$k])) $userInfo[$k] = $data[$k];
                        }



                        $userInfo = json_decode($userInfo , true);

                        $userData = array(
                            'firstname' => $userInfo['given_name'],
                            'lastname' => $userInfo['family_name'],
                            'mobile' => $userInfo['Mobile'],
                            'password' => $userInfo['password'],
                            'email' => $userInfo['email']
                        );




                        $memberData = [
                            'entry' => $userData['mobile'],
                            'password' => $userData['password'],
                            'name' => $userData['firstname'],
                            'family' => $userData['lastname'],
                            'mobile' => $userData['mobile'],
                            'reagentCode' => '',
                            'Type' => 'app'
                        ];

                        $memberController = Load::controller( 'members' );
                        $response = $memberController->memberInsert($memberData);;

                        $info_member = $response;
                        if ($info_member && isset($info_member['data'])) {
                            session_start();
                            $_SESSION['Login'] = 'success';
                            $_SESSION['nameUser'] = $info_member['data']['nameUser'];
                            $_SESSION['userId'] = $info_member['data']['userId'];
                            $_SESSION['typeUser'] = $info_member['data']['typeUser'];
                            $_SESSION['cardNo'] = $info_member['data']['cardNo'];
                            $_SESSION['LastLogin'] = time();
                            $_SESSION['counterTypeId'] = $info_member['data']['counterTypeId'];
                            $_SESSION['layout'] = $info_member['data']['layout'];
                        }

                        $infoCode = array(
                            'RequestStatus' => 'Success',
                            'Message' => 'The operation was successful.'
                        );
                        echo json_encode($infoCode);

                        exit;
                    }
                    else {
                        $infoCode = array(
                            'Result' => array(
                                'Value' => ''
                            ),
                            'RequestStatus' => 'Error',
                            'Message' => 'Your Account Is Not Active',
                            'MessageCode' => 'E0User',
                            'Code' => ''
                        );
                        echo json_encode($infoCode);
                        exit;
                    }
                }
                else {
                    $infoCode = array(
                        'Result' => array(
                            'Value' => ''
                        ),
                        'RequestStatus' => 'Error',
                        'Message' => 'NotValidUserNameOrPassword',
                        'MessageCode' => 'E2User',
                        'Code' => ''
                    );
                    echo json_encode($infoCode);
                    exit;
                }
            } else {
                $infoCode = array(
                    'Result' => array(
                        'Value' => ''
                    ),
                    'RequestStatus' => 'Error',
                    'Message' => 'NotValidUserNameOrPassword',
                    'MessageCode' => 'E1User',
                    'Code' => ''
                );
                echo json_encode($infoCode);
                exit;
            }


        }
        else {
            $infoCode = array(
                'Result' => array(
                    'Value' => ''
                ),
                'RequestStatus' => 'Error',
                'Message' => 'NotValidTypeRequest',
                'MessageCode' => 'E0Request',
                'Code' => ''
            );

            echo json_encode($infoCode);
            exit;
        }

    }

    public function mock_connect_token($mockData) {
        $header = array("alg" => "HS256", "typ" => "JWT");

        $payload = array(
            "given_name" => $mockData['given_name'],
            "family_name" => $mockData['family_name'],
            "email" => $mockData['email'],
            "Mobile" => $mockData['Mobile'],
            "password" => $mockData['password'],
            "iat" => time(),
            "exp" => time() + 3600,
            "iss" => "mock.sso",
        );


        $jwt = $this->base64url_encode(json_encode($header)) . '.' . $this->base64url_encode(json_encode($payload)) . '.' . 'MOCK_SIGNATURE';


        if (!function_exists('random_bytes')) {
            function random_bytes($length) {
                $characters = '0123456789abcdef';
                $bytes = '';
                for ($i = 0; $i < $length; $i++) {
                    $bytes .= $characters[mt_rand(0, strlen($characters) - 1)];
                }
                return $bytes;
            }
        }

        $access_token = 'mock_access_' . bin2hex(random_bytes(8));

        $response = array(
            "id_token" => $jwt,
            "access_token" => $access_token,
            "expires_in" => 3600,
            "token_type" => "Bearer",
            "scope" => "openid profile"
        );

        return $response;
    }

    private function base64url_encode($data) {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }

}

new loginApi();


?>