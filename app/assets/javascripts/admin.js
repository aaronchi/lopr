//= require cocoon
//= require jquery-ui/jquery.ui.core
//= require jquery-ui/jquery.ui.widget
//= require jquery-ui/jquery.ui.mouse
//= require jquery-ui/jquery.ui.sortable

$(function() {
  
  $('[data-sort]').each(function(){
    var el = $(this);
    el.sortable({
      update: function(e, ui){
        $.ajax({
          type: 'put',
          data: el.sortable('serialize'),
          dataType: 'script',
          url: el.data('sort')
        })
      }
    })
  });
  
});