<div class="col-xl-2 col-lg-12 col-md-12 col-sm-12 col-12 p-0 btn_type_way searchbox-radio">
<div class="parent-btn-switch d-flex flex-column">
    <label data-text='یک طرفه' for='rdo-3'  class="switch-way-js btn-switch-searchBox active">
        <input checked="" class="multiselectportal international-one-way-js"
               type="radio" id="rdo-3" name="select-rb" value="1">
        یک طرفه
    </label>
    <label data-text='رفت و برگشت' for='rdo-4'  class="btn-switch-searchBox switch-way-js">
        <input type="radio" class="multiselectportal international-two-way-js"
               id="rdo-4" name="select-rb" value="2" >
        دو طرفه
    </label>
    <div class="parent-cheng-way-internal-external parent-class-cheng">
        <div class="cheng-flight-class dropdown-toggle-cheng" id="dropdown-flight-class" onclick="toggleDropdownFlightClass(event)">
            <h4 class="dropdown-text" id="toggle-text-class">همه</h4>
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
