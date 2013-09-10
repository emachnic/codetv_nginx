$(document).ready(function(){
  // Add code view click handlers
  $.each($('a.switch-format'), function(i, e){
    $(e).click(function(evt){
      var table  = $(this).closest('table'),
          format = $(this).attr('data-format'),
          rows   = table.find('tr[data-format]'),
          target = table.find('tr[data-format="' + format + '"]'),
          anchor = table.find('a[data-format="' + format + '"]').closest('dd');

      $.each(table.find('a.switch-format'), function(i, e){
        $(e).closest('dd').removeClass('active');
      });

      anchor.addClass('active');
      $.each(rows, function(i, e){ $(e).hide(); });
      target.show();
    });
  });

  $.each($('a.view-code.modal'), function(i, e){
    $(e).click(function(evt){
      $('#' + $(this).attr('data-reveal-id')).foundation('reveal','open');
      evt.stopPropagation();
      return false;
    });
  });

  // Set disabled fields
  $.each($('.fields.disabled input'), function(i,e){
    $(e).attr('disabled','disabled');
  });

  // Billing address toggle
  $('.billing_address_toggle').click(function(){
    $('.billing_address').toggle();
  });

  // Make blank links not go to top of page
  $("a[href='#']").click(function(e) {
    e.preventDefault();
  });
});
