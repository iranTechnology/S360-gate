document.addEventListener('DOMContentLoaded', function() {

  // --- Switchery برای سطح دسترسی عملیات ---
  var opsElems = Array.prototype.slice.call(document.querySelectorAll('.operation-checkbox'));
  opsElems.forEach(function(el) {
    new Switchery(el, {
      size: 'small',
      color: '#00c292',         // سبز روشن
      secondaryColor: '#ED5565' // قرمز خاموش
    });
    updateSwitcheryColor(el, '#00c292', '#ED5565');
  });

  // --- Switchery برای منوها ---
  var menuElems = Array.prototype.slice.call(document.querySelectorAll('.parent-checkbox, .child-checkbox, .subchild-checkbox'));
  menuElems.forEach(function(el) {
    new Switchery(el, { size: 'small', color: '#1AB394', secondaryColor: '#ED5565' });
    updateSwitcheryColor(el, '#1AB394', '#ED5565');
  });

  // --- باز و بسته کردن زیرمنوها ---
  document.querySelectorAll('.toggle-collapse').forEach(function(link){
    link.addEventListener('click', function(e){
      e.preventDefault();
      const target = document.querySelector(this.dataset.target);
      target.classList.toggle('collapse');
    });
  });

  // --- کنترل تغییر parent ---
  document.querySelectorAll('.parent-checkbox').forEach(function(parent){
    parent.addEventListener('change', function(){
      var isAccess = this.checked ? 1 : 0;
      var idMenu = $(this).data("id");

      toggleAccess(idMenu, isAccess);
      updateSwitcheryColor(this);

      // پیدا کردن تمام child و subChildهای داخل همان card
      // داخل parent-checkbox handler
      var card = this.closest('.card');
      if(card){
        var childCheckboxes = card.querySelectorAll('.child-checkbox');
        childCheckboxes.forEach(function(child){
          $(child).prop('checked', isAccess);
          updateSwitcheryColor(child);
          toggleAccess($(child).data('id'), isAccess);

          // همه subChildهای داخل همان child
          var subChildrenContainer = child.parentElement.querySelectorAll('.subchild-checkbox');
          subChildrenContainer.forEach(function(subChild){
            $(subChild).prop('checked', isAccess);
            updateSwitcheryColor(subChild);
            toggleAccess($(subChild).data('id'), isAccess);
          });
        });
      }

    });
  });

  // --- کنترل تغییر child ---
  $(document).on('change', '.child-checkbox', function(){
    var child = $(this);
    var idMenu = child.data("id");
    var isAccess = child.prop('checked') ? 1 : 0;
    toggleAccess(idMenu, isAccess);
    updateSwitcheryColor(child[0]);

    // همگام‌سازی subChild
    child.closest('.mb-3, .p-2').find('.subchild-checkbox').each(function(){
      $(this).prop('checked', isAccess);
      updateSwitcheryColor(this);
      toggleAccess($(this).data('id'), isAccess);
    });
  });

  // --- کنترل تغییر subChild ---
  $(document).on('change', '.subchild-checkbox', function(){
    var subChild = $(this);
    var idMenu = subChild.data("id");
    var isAccess = subChild.prop('checked') ? 1 : 0;
    toggleAccess(idMenu, isAccess);
    updateSwitcheryColor(subChild[0]);
  });

});

// --- توابع کمکی ---
function toggleAccess(idMenu, isAccess){
  $.ajax({
    url: amadeusPath + 'user_ajax.php',
    type: "POST",
    data: {
      flag: "StatusMenuOtherLang",
      idMenu: idMenu,
      isAccess: isAccess
    },
    success: function(response){
      var res = response.split(':');
      console.log(res[1]);
    }
  });
}

function updateSwitcheryColor(checkbox, colorOn = '#1AB394', colorOff = '#ED5565'){
  var switchery = checkbox.nextSibling;
  if(switchery && switchery.classList.contains('switchery')){
    var checked = checkbox.checked;
    switchery.style.backgroundColor = checked ? colorOn : colorOff;
    switchery.style.borderColor = checked ? colorOn : colorOff;
    var small = switchery.querySelector('small');
    if(small){ small.style.left = checked ? '20px' : '0px'; }
  }
}
