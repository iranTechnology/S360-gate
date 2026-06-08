{$col}

<div class="{if isset($col) } {$col} {else} col-lg-3{/if} col-md-6 col-sm-6 col-12 col_search col_with_route">

    <div class="form-group">
        <div class="form-group origin_start">
            <i class="fas fa-map-marker-alt fa-lg mr-1" style="padding-right:2px;"></i>
            <input
                    type="text"
                    id="route_origin_all"
                    onclick="showAirportList(this)"
                    onkeyup="showAirportList(this)"
                    autocomplete='off'
                    class="form-control inputSearchLocal"
                    placeholder="فرودگاه">
            <div id="list_airport_origin_cip" class="resultUlInputSearch list-show-result"></div>

        </div>
    </div>
</div>