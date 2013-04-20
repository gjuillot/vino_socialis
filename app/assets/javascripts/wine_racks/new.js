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
    
    wine_rack_preview();
  });
  
  $("input").keyup(wine_rack_preview);
  wine_rack_preview();
});

function wine_rack_preview() {
  var layout = $("select#wine_rack_layout").val();
  var total_rows = parseInt($("input#wine_rack_total_rows").val());
  var total_columns = parseInt($("input#wine_rack_total_columns").val());
  var rows = parseInt($("input#wine_rack_rows").val());
  var columns = parseInt($("input#wine_rack_columns").val());
  
  var img = $("#bottle_img > img").attr('src');
  
  var table = '<table border="solid">';
  for(var total_row = 0; total_row<total_rows; total_row++) {
    table += '<tr>';
    for(var total_column = 0; total_column<total_columns; total_column++) {
      table += '<td>';
      if ((layout == 'front_back_cellar') || (layout == 'front_back_cellar_2')) {
        table += (total_column == 0 ? 'Avant' : 'Arrière') + '<br/>';
      }
      table += '<table>'
      for(var row = 0; row<rows; row++) {
        table += '<tr align="middle">';
        var shorten_row = wine_rack_preview_shorten_row(layout, total_row, total_column, rows, row);
        for(var column = 0; column<columns - (shorten_row ? 1 : 0); column++) {
          table += '<td>';
          table += '<img height="12" src="' + img + '" style="position:relative;left:' + (shorten_row ? '7' : '0') +'px" width="12" />';
          table += '</td>';
        }
        table += '</tr>';
      }
      table += '</table>'
      table += '</td>';
    }
    table += '</tr>';
  }
  table += '</table>'
  
  $('div#preview').html(table);
}

function wine_rack_preview_shorten_row(layout, total_row, total_column, rows, row) {
  if (layout == 'simple') return false;
  if (layout == 'cabinet') return ((rows - row) % 2 == 0);
  if (layout == 'alternated_cabinet') return ((total_row + rows - row) % 2 == 0);
  if (layout == 'front_back_cellar') return ((total_column + rows - row) % 2 == 0);
  if (layout == 'front_back_cellar_2') return !((total_column + rows - row) % 2 == 0);
}
