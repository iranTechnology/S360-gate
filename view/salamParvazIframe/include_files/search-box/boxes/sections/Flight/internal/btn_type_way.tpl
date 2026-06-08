<div class="col-12 col-xl-2 col-lg-12 col-md-12 col-sm-12 d-ceckboxs p-0 btn_type_way searchbox-radio" >
        <div class="parent-btn-switch d-flex flex-column">
            <label data-text='یک طرفه' for='rdo-10'  class="btn-switch-searchBox switch-way-js active">
                <input  checked="" type="radio" id="rdo-10" name="select-rb2" value="1" class="internal-one-way-js">
                یک طرفه
            </label>
            <label data-text='دو طرفه' class="btn-switch-searchBox switch-way-js" for='rdo-20'>
                <input type="radio" id="rdo-20" name="select-rb2" value="2" class="internal-two-way-js">
                دو طرفه
            </label>
            <div class="parent-cheng-way-internal-external parent-class-cheng">
                <div class="cheng-flight-class dropdown-toggle-cheng" id="dropdown-flight-class" onclick="toggleDropdownFlightClass(event)">
                    <h4 class="dropdown-text" id="toggle-text-class">اکونومی</h4>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <path d="M362.7 203.9l-159.1 144c-6.125 5.469-15.31 5.469-21.44 0L21.29 203.9C14.73 197.1 14.2 187.9 20.1 181.3C26.38 174.4 36.5 174.5 42.73 180.1L192 314.5l149.3-134.4c6.594-5.877 16.69-5.361 22.62 1.188C369.8 187.9 369.3 197.1 362.7 203.9z"/>
                    </svg>
                    <ul class="money-filter_ul arrow-up2" id="flight-class-dropdown">
                        <li>
                            <div class="switch-class-js" onclick="event.stopPropagation(); selectFlightClass('اکونومی', 'economy', event)">
                                اکونومی
                            </div>
                        </li>
                        <li>
                            <div class="switch-class-js" onclick="event.stopPropagation(); selectFlightClass('پریمیوم', 'premium_economy', event)">
                                پریمیوم
                            </div>
                        </li>
                        <li>
                            <div class="switch-class-js" onclick="event.stopPropagation(); selectFlightClass('بیزینس', 'business', event)">
                                بیزینس
                            </div>
                        </li>
                        <li>
                            <div class="switch-class-js" onclick="event.stopPropagation(); selectFlightClass('همه', 'all', event)">
                                همه
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

</div>



