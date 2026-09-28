<form method="post" id="formPassengerDetailHotelLocal" action="{$smarty.const.ROOT_ADDRESS}/factorHotelNew">
    <input type="hidden" name="StatusRefresh" id="StatusRefresh" value="NoRefresh">
    <input type="hidden" id="numberRow" value="0">
    <input type="hidden" value="{$requestNumber}" name="requestNumber">

    {assign var="i" value=0}
    {assign var="rooms_count" value=0}
    {assign var="totalAdultCount" value=0}
    {assign var="totalChildCount" value=0}
    <input type="hidden" name="ZoneFlight" id="ZoneFlight" value="external">

    {* --- بخش هوشمند و ایمن پرووایدر 46 (تک اتاق) در صورت از بین رفتن داده‌های لاگین --- *}
    {if empty($temproryHotelLocal)}
        {assign var="adt_count" value=1}
        {assign var="chd_count" value=0}
        {assign var="raw_searchRooms" value=$smarty.post.searchRooms|default:$hotelDetail.search_rooms|default:'R:1-0-0'}

        {if !empty($raw_searchRooms) && $raw_searchRooms neq 'undefined'}
            {assign var="srParts" value=":"|explode:$raw_searchRooms}
            {if isset($srParts[1])}
                {assign var="roomSpecs" value="-"|explode:$srParts[1]}
                {if isset($roomSpecs[0]) && $roomSpecs[0]|intval gt 0}
                    {assign var="adt_count" value=$roomSpecs[0]|intval}
                {/if}
                {if isset($roomSpecs[1])}
                    {assign var="chd_count" value=$roomSpecs[1]|intval}
                {/if}
            {/if}
        {/if}

        {* ساخت ساختار استاندارد تک اتاق *}
        {assign var="virtualRoom" value=[
        'room_id' => '999',
        'room_name' => 'Room 1',
        'AdultsCount' => $adt_count,
        'ChildCount' => $chd_count,
        'RoomIndex' => 1
        ]}
        {assign var="temproryHotelLocal" value=[$virtualRoom]}
    {/if}
    {* --- پایان بخش هوشمند --- *}

    {foreach $temproryHotelLocal as $keyRooms => $room}
        {assign var="roomNumber" value=$keyRooms+1}
        {assign var="childCount" value=$room['ChildCount']|default:0}
        {assign var="adultCount" value=$room['AdultsCount']|default:1}

        {if $adultCount lt 1}
            {assign var="adultCount" value=1}
        {/if}

        {assign var="totalAdultCount" value=$totalAdultCount+$adultCount}
        {assign var="totalChildCount" value=$totalChildCount+$childCount}

        {assign var="room_name" value=$room['room_name']|default:'Room 1'}
        {assign var="IndexFor" value=0}

        <input type="hidden" name="adultCount{$roomNumber}" id="adultCount{$roomNumber}" value="{$adultCount}">

        {for $adultNumber = 1 to $adultCount}
            <input type="hidden" name="roomIndex{$roomNumber}" value="{$room['RoomIndex']|default:1}">

            <div class="s-u-passenger-wrapper s-u-passenger-wrapper-change first pb-2">
                <span class="s-u-last-p-bozorgsal s-u-last-p-bozorgsal-change site-main-text-color direcR">
                    {$IndexFor = $IndexFor + 1}
                    مسافر {$IndexFor} (بزرگسال)
                </span>

                <input type="hidden" name="RoomCount_Reserve{$room['room_id']}" id="RoomCount_Reserve{$room['room_id']}" value="1">
                <input type="hidden" name="Id_Select_Room{$roomNumber}" id="Id_Select_Room{$roomNumber}" value="{$room['room_id']}">

                <div class="panel-default-change site-border-main-color pb-2">
                    <div class="panel-heading-change">
                        <span class="hidden-xs-down" style="display:none !important;">##Nation##:</span>

                        <span class="kindOfPasenger" style="display:none !important;">
                            <label class="control--checkbox">
                                <span>##Iranian##</span>
                                <input type="radio"
                                       name="passengerNationalityA{$roomNumber}{$adultNumber}"
                                       id="passengerNationalityA{$roomNumber}{$adultNumber}"
                                       value="0"
                                       class="nationalityChange"
                                >
                                <div class="checkbox">
                                    <div class="filler"></div>
                                    <svg fill="#000000" viewBox="0 0 30 30">
                                        <path d="M 26.980469 5.9902344 A 1.0001 1.0001 0 0 0 26.292969 6.2929688 L 11 21.585938 L 4.7070312 15.292969 A 1.0001 1.0001 0 1 0 3.2929688 16.707031 L 10.292969 23.707031 A 1.0001 1.0001 0 0 0 11.707031 23.707031 L 27.707031 7.7070312 A 1.0001 1.0001 0 0 0 26.980469 5.9902344 z"/>
                                    </svg>
                                </div>
                            </label>
                        </span>

                        <span class="kindOfPasenger" style="display:none !important;">
                            <label class="control--checkbox">
                                <span>##Another##</span>
                                <input type="radio"
                                       name="passengerNationalityA{$roomNumber}{$adultNumber}"
                                       id="passengerNationalityA{$roomNumber}{$adultNumber}_1"
                                       value="1"
                                       class="nationalityChange"
                                       checked="checked">
                                <div class="checkbox">
                                    <div class="filler"></div>
                                    <svg fill="#000000" viewBox="0 0 30 30">
                                        <path d="M 26.980469 5.9902344 A 1.0001 1.0001 0 0 0 26.292969 6.2929688 L 11 21.585938 L 4.7070312 15.292969 A 1.0001 1.0001 0 1 0 3.2929688 16.707031 L 10.292969 23.707031 A 1.0001 1.0001 0 0 0 11.707031 23.707031 L 27.707031 7.7070312 A 1.0001 1.0001 0 0 0 26.980469 5.9902344 z"/>
                                    </svg>
                                </div>
                            </label>
                        </span>

                        {if $objSession->IsLogin()}
                            <span class="s-u-last-passenger-btn s-u-last-passenger-btn-change"
                                  onclick="setHidenFildnumberRow('A{$roomNumber}{$adultNumber}')">
                                <i class="zmdi zmdi-pin-account zmdi-hc-fw"></i> ##Passengerbook##
                            </span>
                        {/if}
                    </div>

                    <div class="clear"></div>

                    <div class="panel-body-change">
                        <div class="s-u-passenger-item s-u-passenger-item-change">
                            <select id="genderA{$roomNumber}{$adultNumber}" name="genderA{$roomNumber}{$adultNumber}" required aria-required="true">
                                <option value="" disabled="disabled" selected="selected">##Sex##</option>
                                <option value="Male">##Sir##</option>
                                <option value="Female">##Lady##</option>
                            </select>
                        </div>

                        <div class="{if $typeApplication eq 'externalApi'}s-u-passenger-item {/if}s-u-passenger-item-hotel s-u-passenger-item-change">
                            <input id="nameEnA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##Nameenglish##"
                                   name="nameEnA{$roomNumber}{$adultNumber}"
                                   oninput="return validateEnglishInput('nameEnA{$roomNumber}{$adultNumber}')">
                        </div>

                        <div class="{if $typeApplication eq 'externalApi'}s-u-passenger-item {/if}s-u-passenger-item-hotel s-u-passenger-item-change">
                            <input id="familyEnA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##Familyenglish##"
                                   name="familyEnA{$roomNumber}{$adultNumber}"
                                   oninput="return validateEnglishInput('familyEnA{$roomNumber}{$adultNumber}')">
                        </div>

                        <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change noneIranian">
                            <input id="birthdayEnA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##miladihappybirthday##"
                                   name="birthdayEnA{$roomNumber}{$adultNumber}"
                                   class="gregorianAdultBirthdayCalendar"
                                   readonly="readonly">
                        </div>

                        {* if $smarty.const.SOFTWARE_LANG eq 'fa' *}
                        <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change">
                            <input id="nameFaA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##Namepersion##"
                                   name="nameFaA{$roomNumber}{$adultNumber}"
                                   oninput="return validatePersianInput('nameFaA{$roomNumber}{$adultNumber}')"
                                   class="justpersian">
                        </div>

                        <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change">
                            <input id="familyFaA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##Familypersion##"
                                   name="familyFaA{$roomNumber}{$adultNumber}"
                                   oninput="return validatePersianInput('familyFaA{$roomNumber}{$adultNumber}')"
                                   class="justpersian">
                        </div>
                        {*/if*}

                        <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change justIranian">
                            <input id="birthdayA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##shamsihappybirthday##"
                                   name="birthdayA{$roomNumber}{$adultNumber}"
                                   class="shamsiAdultBirthdayCalendar"
                                   readonly="readonly">
                        </div>

                        <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change justIranian">
                            <input id="NationalCodeA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##Nationalnumber##"
                                   name="NationalCodeA{$roomNumber}{$adultNumber}"
                                   maxlength="10"
                                   class="UniqNationalCode">
                        </div>

                        <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change noneIranian">
                            <select name="passportCountryA{$roomNumber}{$adultNumber}"
                                    id="passportCountryA{$roomNumber}{$adultNumber}"
                                    class="select2">
                                <option value="">##Countryissuingpassport##</option>
                                {foreach $objFunctions->CountryCodes() as $Country}
                                    <option value="{$Country['code']}">
                                        {if $smarty.const.SOFTWARE_LANG eq 'fa'}
                                            {$Country['titleFa']}
                                        {else}
                                            {$Country['titleEn']}
                                        {/if}
                                    </option>
                                {/foreach}
                            </select>
                        </div>

                        <div style="display:inline-block !important;" class="s-u-passenger-item s-u-passenger-item-change noneIranian">
                            <input id="passportNumberA{$roomNumber}{$adultNumber}"
                                   type="text"
                                   placeholder="##Numpassport##"
                                   name="passportNumberA{$roomNumber}{$adultNumber}"
                                   class="UniqPassportNumber">
                        </div>

                        <input type="hidden" id="BedType{$roomNumber}{$adultNumber}" name="BedType{$roomNumber}{$adultNumber}" value="Twin">
                        <div class="alert_msg" id="messageA{$roomNumber}{$adultNumber}"></div>
                    </div>
                </div>

                <div class="clear"></div>
            </div>
        {/for}

        {if $childCount gt 0}
            <input type="hidden" name="childCount{$roomNumber}" id="childCount{$roomNumber}" value="{$childCount}">

            {for $childNumber = 1 to $childCount}
                <input type="hidden" name="roomIndex{$roomNumber}" value="{$room['RoomIndex']|default:1}">

                <div class="s-u-passenger-wrapper s-u-passenger-wrapper-change first pb-2">
                    <span class="s-u-last-p-bozorgsal s-u-last-p-bozorgsal-change site-main-text-color direcR">
                        {$IndexFor = $IndexFor + 1}
                        مسافر {$IndexFor} (کودک)
                    </span>

                    <input type="hidden" name="RoomCount_Reserve{$room['room_id']}" id="RoomCount_ReserveChild{$room['room_id']}" value="1">
                    <input type="hidden" name="Id_Select_Room{$roomNumber}" id="Id_Select_RoomChild{$roomNumber}" value="{$room['room_id']}">

                    <div class="panel-default-change site-border-main-color">
                        <div class="panel-heading-change">
                            <span class="hidden-xs-down" style="display:none !important;">##Nation##:</span>

                            <span style="display:none !important;" class="kindOfPasenger">
                                <label class="control--checkbox">
                                    <span>##Iranian##</span>
                                    <input type="radio"
                                           name="passengerNationalityC{$roomNumber}{$childNumber}"
                                           id="passengerNationalityC{$roomNumber}{$childNumber}"
                                           value="0"
                                           class="nationalityChange">
                                    <div class="checkbox">
                                        <div class="filler"></div>
                                        <svg fill="#000000" viewBox="0 0 30 30">
                                            <path d="M 26.980469 5.9902344 A 1.0001 1.0001 0 0 0 26.292969 6.2929688 L 11 21.585938 L 4.7070312 15.292969 A 1.0001 1.0001 0 1 0 3.2929688 16.707031 L 10.292969 23.707031 A 1.0001 1.0001 0 0 0 11.707031 23.707031 L 27.707031 7.7070312 A 1.0001 1.0001 0 0 0 26.980469 5.9902344 z"/>
                                        </svg>
                                    </div>
                                </label>
                            </span>

                            <span style="display:none !important;" class="kindOfPasenger">
                                <label class="control--checkbox">
                                    <span>##Another##</span>
                                    <input type="radio"
                                           name="passengerNationalityC{$roomNumber}{$childNumber}"
                                           id="passengerNationalityC{$roomNumber}{$childNumber}_1"
                                           value="1"
                                           class="nationalityChange"
                                           checked="checked">
                                    <div class="checkbox">
                                        <div class="filler"></div>
                                        <svg fill="#000000" viewBox="0 0 30 30">
                                            <path d="M 26.980469 5.9902344 A 1.0001 1.0001 0 0 0 26.292969 6.2929688 L 11 21.585938 L 4.7070312 15.292969 A 1.0001 1.0001 0 1 0 3.2929688 16.707031 L 10.292969 23.707031 A 1.0001 1.0001 0 0 0 11.707031 23.707031 L 27.707031 7.7070312 A 1.0001 1.0001 0 0 0 26.980469 5.9902344 z"/>
                                        </svg>
                                    </div>
                                </label>
                            </span>

                            {if $objSession->IsLogin()}
                                <span class="s-u-last-passenger-btn s-u-last-passenger-btn-change"
                                      onclick="setHidenFildnumberRow('C{$roomNumber}{$childNumber}')">
                                    <i class="zmdi zmdi-pin-account zmdi-hc-fw"></i> ##Passengerbook##
                                </span>
                            {/if}
                        </div>

                        <div class="clear"></div>

                        <div class="panel-body-change">
                            <div class="s-u-passenger-item s-u-passenger-item-change">
                                <select id="genderC{$roomNumber}{$childNumber}" name="genderC{$roomNumber}{$childNumber}">
                                    <option value="" disabled="disabled" selected="selected">##Sex##</option>
                                    <option value="Male">##Sir##</option>
                                    <option value="Female">##Lady##</option>
                                </select>
                            </div>

                            <div class="{if $typeApplication eq 'externalApi'}s-u-passenger-item {/if}s-u-passenger-item-hotel s-u-passenger-item-change">
                                <input id="nameEnC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##Nameenglish##"
                                       name="nameEnC{$roomNumber}{$childNumber}"
                                       oninput="return validateEnglishInput('nameEnC{$roomNumber}{$childNumber}')">
                            </div>

                            <div class="{if $typeApplication eq 'externalApi'}s-u-passenger-item {/if}s-u-passenger-item-hotel s-u-passenger-item-change">
                                <input id="familyEnC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##Familyenglish##"
                                       name="familyEnC{$roomNumber}{$childNumber}"
                                       oninput="return validateEnglishInput('familyEnC{$roomNumber}{$childNumber}')">
                            </div>

                            <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change noneIranian">
                                <input id="birthdayEnC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##miladihappybirthday##"
                                       name="birthdayEnC{$roomNumber}{$childNumber}"
                                       class="gregorianChildBirthdayCalendar"
                                       readonly="readonly">
                            </div>

                            {*if $smarty.const.SOFTWARE_LANG eq 'fa'*}
                            <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change">
                                <input id="nameFaC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##Namepersion##"
                                       name="nameFaC{$roomNumber}{$childNumber}"
                                       oninput="return validatePersianInput('nameFaC{$roomNumber}{$childNumber}')"
                                       class="justpersian">
                            </div>

                            <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change">
                                <input id="familyFaC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##Familypersion##"
                                       name="familyFaC{$roomNumber}{$childNumber}"
                                       oninput="return validatePersianInput('familyFaC{$roomNumber}{$childNumber}')"
                                       class="justpersian">
                            </div>
                            {*/if*}

                            <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change justIranian">
                                <input id="birthdayC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##shamsihappybirthday##"
                                       name="birthdayC{$roomNumber}{$childNumber}"
                                       class="shamsiChildBirthdayCalendar"
                                       readonly="readonly">
                            </div>

                            <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change justIranian">
                                <input id="NationalCodeC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##Nationalnumber##"
                                       name="NationalCodeC{$roomNumber}{$childNumber}"
                                       maxlength="10"
                                       class="UniqNationalCode">
                            </div>

                            <div style="display:none !important;" class="s-u-passenger-item s-u-passenger-item-change noneIranian">
                                <select name="passportCountryC{$roomNumber}{$childNumber}"
                                        id="passportCountryC{$roomNumber}{$childNumber}"
                                        class="select2">
                                    <option value="">##Countryissuingpassport##</option>
                                    {foreach $objFunctions->CountryCodes() as $Country}
                                        <option value="{$Country['code']}">
                                            {if $smarty.const.SOFTWARE_LANG eq 'fa'}
                                                {$Country['titleFa']}
                                            {else}
                                                {$Country['titleEn']}
                                            {/if}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>

                            <div style="display:inline-block !important;" class="s-u-passenger-item s-u-passenger-item-change noneIranian">
                                <input id="passportNumberC{$roomNumber}{$childNumber}"
                                       type="text"
                                       placeholder="##Numpassport##"
                                       name="passportNumberC{$roomNumber}{$childNumber}"
                                       class="UniqPassportNumber">
                            </div>

                            <input type="hidden" id="BedType{$roomNumber}{$childNumber}" name="BedType{$roomNumber}{$childNumber}" value="Twin">
                            <div class="alert_msg" id="messageC{$roomNumber}{$childNumber}"></div>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            {/for}
        {/if}

        {$rooms_count = ($rooms_count + 1)}
    {/foreach}

    <input type="hidden" name="rooms_count" value="{$rooms_count}">

    <div class="s-u-passenger-wrapper s-u-passenger-wrapper-change-Buyer first">
    <span class="s-u-last-p-pasenger s-u-last-p-pasenger-change passenger_leader site-main-text-color">
        ##InformationSaler##
    </span>

        <div class="clear"></div>

        <div class="panel-default-change-Buyer">
            {* نمایش متنی و تمیز اطلاعات خریدار برای کاربر *}
            <div class="buyer-info-display" style="display: flex; width: 100%; justify-content: space-between; align-items: center; flex-wrap: wrap; padding: 14px 25px; background: #f8fafc; border-radius: 8px; border: 1px solid #e2e8f0; margin-bottom: 15px; font-size: 13.5px; box-sizing: border-box;">

                <div style="display: flex; align-items: center;">
                    <strong style="color: #64748b; margin-left: 6px;">##Namefamily##:</strong>
                    <span style="font-weight: 600; color: #1e293b;">
            {if is_array($InfoMember) && ($InfoMember.name neq '' || $InfoMember.family neq '')}
                {$InfoMember.name} {$InfoMember.family}
            {else}
                -
            {/if}
        </span>
                </div>

                <div style="display: flex; align-items: center;">
                    <strong style="color: #64748b; margin-left: 6px;">##Phonenumber##:</strong>
                    <span class="dir-ltr" style="font-weight: 600; color: #1e293b; display: inline-block;">
            {if is_array($InfoMember) && $InfoMember.mobile neq ''}
                {$InfoMember.mobile}
            {else}
                -
            {/if}
        </span>
                </div>

                <div style="display: flex; align-items: center;">
                    <strong style="color: #64748b; margin-left: 6px;">##Email##:</strong>
                    <span class="dir-ltr" style="font-weight: 600; color: #1e293b; display: inline-block;">
            {if is_array($InfoMember) && $InfoMember.email neq ''}
                {$InfoMember.email}
            {else}
                -
            {/if}
        </span>
                </div>

            </div>

            {* اینپوت‌های اصلی به صورت مخفی نگه‌داشته شده‌اند تا فرم بدون مشکل سابمیت شود *}
            <div style="display: none !important;">
                <input id="passenger_leader_room_fullName"
                       type="hidden"
                       placeholder="##Namefamily##"
                       name="passenger_leader_room_fullName"
                       class="dir-ltr"
                       {if (is_array($InfoMember) && ($InfoMember.name neq '' || $InfoMember.family neq ''))}value="{$InfoMember.name} {$InfoMember.family}"{/if}>

                <input id="passenger_leader_room"
                       type="hidden"
                       placeholder="##Phonenumber##"
                       name="passenger_leader_room"
                       class="dir-ltr"
                       {if (is_array($InfoMember) && $InfoMember.mobile neq '')}value="{$InfoMember.mobile}"{/if}>

                <input id="passenger_leader_room_email"
                       type="hidden"
                       placeholder="##Email##"
                       name="passenger_leader_room_email"
                       class="dir-ltr"
                       {if (is_array($InfoMember) && $InfoMember.email neq '')}value="{$InfoMember.email}"{/if}>
            </div>

            <div class="alert_msg" id="messagePassengerLeader"></div>
        </div>

        <div class="clear"></div>
    </div>


    <input type="hidden" id="TotalNumberRoom_Reserve" name="TotalNumberRoom_Reserve" value="{$TotalNumberRoom}">
    <input type="hidden" id="TotalPrice_Reserve" name="TotalPrice_Reserve" value="{$TotalPrice}">
    <input type="hidden" id="idCity_Reserve" name="idCity_Reserve" value="{$smarty.post.IdCity_Reserve}">
    <input type="hidden" id="Hotel_Reserve" name="Hotel_Reserve" value="{$smarty.post.idHotel_reserve}">
    <input type="hidden" id="RoomTypeCodes_Reserve" name="RoomTypeCodes_Reserve" value="{$roomTypeCodes}">
    <input type="hidden" id="NumberOfRooms_Reserve" name="NumberOfRooms_Reserve" value="{$numberOfRooms}">
    <input type="hidden" id="StartDate_Reserve" name="StartDate_Reserve" value="{$smarty.post.startDate_reserve}">
    <input type="hidden" id="EndDate_Reserve" name="EndDate_Reserve" value="{$smarty.post.endDate_reserve}">
    <input type="hidden" id="Nights_Reserve" name="Nights_Reserve" value="{$smarty.post.nights_reserve}">
    <input type="hidden" id="time_remmaining" value="" name="time_remmaining">
    <input type="hidden" id="factorNumber" name="factorNumber" value="{$smarty.post.factorNumber}">
    <input type="hidden" id="searchRooms" name="searchRooms" value="{$smarty.post.searchRooms|default:$hotelDetail.search_rooms|default:'R:1-0-0'}">
    <input type="hidden" id="typeApplication" name="typeApplication" value="{$typeApplication}">
    <input type="hidden" id="source_id" name="source_id" value="{$smarty.post.source_id}">
    <input type="hidden" id="is_internal" name="is_internal" value="{$IsInternal}">
    <input type="hidden" id="CurrencyCode" name="CurrencyCode" value="{$smarty.post.CurrencyCode}">
    <input type="hidden" value="" name="idMember" id="idMember">
    <input type="hidden" name="Temporary_Room_Id" id="Temporary_Room_Id" value="{$temproryRooms[0].room_id}">

    <div class="btns_factors_n">
        <div class="next_hotel__">
            <a href="" onclick="return false" class="f-loader-check loaderpassengers" id="loader_check" style="display:none"></a>
            <button type="button"
                    onclick="checkHotelTravzilla('{$smarty.now}','{$totalAdultCount}','{$totalChildCount}','{$requestNumber}')"
                    class="s-u-submit-passenger s-u-select-flight-change s-u-submit-passenger-Buyer site-bg-main-color"
                    id="send_data">
                ##NextStepInvoice##&nbsp;
                <i class="fa-solid fa-arrow-left"></i>
            </button>
        </div>
    </div>
</form>
