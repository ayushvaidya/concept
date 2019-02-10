document.addEventListener("turbolinks:load", function() {

  $('div[data-list-id]').sortable({
    update: function(e, ui) {
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });

});
