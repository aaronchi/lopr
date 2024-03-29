//= require cocoon
//= require jquery.ui.sortable
//= require jquery.ui.autocomplete
//= require autocomplete-rails
//= require tinymce-jquery

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