<div class="col-lg-6 col-md-6 col-sm-6 col-12 col_search p-sm-3 p-1">
    <div class="form-group">
<select aria-hidden="true" class="select2_in select2-hidden-accessible continent-visa-js" onchange="fillComboByContinent(this)" data-placeholder=" قاره" id="visa_continent" name="visa_continent" tabindex="-1">
 {foreach $continents as $continent}
<option value="">##ChoseOption##...</option>
<option value="{$continent['id']}">{$continent['titleFa']}</option>
{/foreach}
</select>
</div>
</div>


