$('.wine_racks.index').ready(function() {
  $('tr').click(function() {
    window.location = $(this).find("input").val();
  });
});