{assign var="default_flight_service" value='internalFlight'}
{if isset($special_page.position) && $special_page.position eq 'internationalFlight'}
    {assign var="default_flight_service" value='internationalFlight'}
{/if}
{assign var="default_flight_positions" value=$special_pages->listAllPositions($default_flight_service)}
{foreach ['origin' => 'مبدا', 'destination' => 'مقصد'] as $default_key => $default_label}
    <div class="col-md-6">
        <label for="flight_default_{$default_key}">{$default_label} پیش‌فرض</label>
        <select class="form-control select2 flight-default-airport" name="flight_default_{$default_key}" id="flight_default_{$default_key}">
            <option value="">انتخاب {$default_label}</option>
            {foreach $default_flight_positions as $value => $position}
                <option value="{$value|escape}" {if isset($special_page.flight_search_defaults[$default_key].code) && $special_page.flight_search_defaults[$default_key].code eq $value}selected{/if}>{$position.name|escape}</option>
            {/foreach}
        </select>
    </div>
{/foreach}
