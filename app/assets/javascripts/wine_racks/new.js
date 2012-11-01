$('.wine_racks.new').ready(function() {
  $("select#wine_rack_layout").change(function() {
    var layout = $(this).val();
    if ((layout == "front_back_cellar") || (layout == "front_back_cellar_2")) {
      $("input#wine_rack_total_rows").val('1');
      $("input#wine_rack_total_rows").attr("disabled", true)
      $("input#wine_rack_total_columns").val('2');
      $("input#wine_rack_total_columns").attr("disabled", true)
    } else {
      $("input#wine_rack_total_rows").attr("disabled", false)
      $("input#wine_rack_total_columns").attr("disabled", false)
    };
    
    $("img#example").attr("src", "/assets/wine_racks/example/" + $('input#locale').attr('value') + "/" + layout + ".jpg");
  });
}); 