{assign var="info_access_client_to_service" value=$info_access_client_to_service}
{load_presentation_object filename="specialPages" assign="objSpecialPages"}
<div class="radios" id="myTab">
    <div class="switch">
        <input autocomplete="off"
               type="radio"
               class="switch-input switch-input-js"
               name="btn_switch_flight"
               value="1"
               id="raftobar">
        <label for="raftobar"
               class="switch-label switch-label-on">
            ##internationalFlight##
        </label>



        <input autocomplete="off"
               type="radio"
               class="switch-input switch-input-js"
               name="btn_switch_flight"
               value="2"
               checked=""
               id="raft">
        <label for="raft"
               class="switch-label switch-label-off">
            ##DomesticFlight##
        </label>
        <span class="switch-selection"></span>
    </div>
</div>