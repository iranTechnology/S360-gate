(function () {
  function applyDefaults() {
    const node = document.getElementById('special-page-flight-defaults');
    if (!node || !window.jQuery) return;
    const defaults = JSON.parse(node.textContent);
    const $ = window.jQuery;
    const internal = defaults.service === 'internalFlight';
    const mode = internal ? 'internal' : 'international';
    if (!internal) {
      $('.switch-btn-js[data-target="international_flight"]').first().trigger('click');
    }
    ['origin', 'destination'].forEach(function (field) {
      const airport = defaults[field];
      const title = typeof lang !== 'undefined' && lang !== 'fa' ? airport.title_en : airport.title;
      const visible = internal ? '.route_' + field + '_internal-js' : '.iata-' + field + '-international-js';
      $(visible).val(title);
      $('.' + field + '-' + mode + '-js').val(airport.code);
    });
    // Set once after initialization; visitors can subsequently change all fields.
    const date = $('.departure-date-' + mode + '-js');
    date.each(function () {
      const input = $(this);
      const gregorian = input.hasClass('deptCalendar-en') ||
        (typeof lang !== 'undefined' && lang !== 'fa');
      input.val(gregorian ? defaults.today_gregorian : defaults.today_jalali);
    });
  }
  if (document.readyState === 'complete') applyDefaults();
  else window.addEventListener('load', applyDefaults, {once: true});
})();
