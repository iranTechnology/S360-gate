{assign var='counter' value=$obj_main_page->reservationTourCount()}

<section class="counter-hotel-tour">
    <div>
        <h2>1,170,914</h2>
        <h3>هتل</h3>
    </div>
    <div>
        <h2>{$counter[0]['total_tours_count']|number_format}</h2>
        <h3>تور</h3>
    </div>
</section>