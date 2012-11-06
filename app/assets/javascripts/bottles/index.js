function filter_text(input) {
  var searched = $("input#" + input).val();
  if (searched.length > 0) {
    var pattern = new RegExp(".*" + searched + ".*", 'i');
    $("td[id*=" + input + "]").each(function() {
      var wine_value = $(this).html();
      if (!(pattern.test(wine_value))) {
        $(this).parent().hide();
      }
    });
  }
}

function filter_text_with_link(input) {
  var searched = $("input#" + input).val();
  if (searched.length > 0) {
    var pattern = new RegExp(".*<a.*>[^<]*" + searched + "[^<]*</a>.*", 'i');
    $("td[id*=" + input + "]").each(function() {
      var wine_value = $(this).html();
      if (!(pattern.test(wine_value))) {
        $(this).parent().hide();
      }
    });
  }
}

function filter_color(select) {
  var color = $("select#wine_color").val();
  if (color.length > 0) {
    var pattern6 = new RegExp('.*\/'+color+'.*\.png');
    $("td[id*=wine_color] a img").each(function() {
      var color_src = $(this).attr('src');
      if (!(pattern6.test(color_src))) {
        $(this).parent().parent().parent().hide();
      }
    });
  }
}

function filter_vintage(input) {
  var vintage = $("input#vintage").val();
  if (vintage.length > 0) {
    $("td[id*=vintage] span").each(function() {
      var wine_vintage = parseInt($(this).html());
      if (vintage.charAt(0) == '<') {
        if (vintage.length == 5) {
          vintageInt = parseInt(vintage.substring(1));
          if (!(wine_vintage < vintageInt)) {
            $(this).parent().parent().hide();
          }
        }
      } else if (vintage.charAt(0) == '>') {
        if (vintage.length == 5) {
          vintageInt = parseInt(vintage.substring(1));
          if (!(wine_vintage > vintageInt)) {
            $(this).parent().parent().hide();
          }
        }
      } else if (vintage.length == 4) {
        if (!($(this).html() == vintage)) {
          $(this).parent().parent().hide();
        }
      } else if (vintage == '-') {
        if (!($(this).html() == vintage)) {
          $(this).parent().parent().hide();
        }
      }
    });
  }
}

function filter_compare(input) {
  var searched = $("input#" + input).val();
  if (searched.length > 0) {
    $("td[id*=" + input + "] span#raw").each(function() {
      var wine_searched_value = parseFloat($(this).html());
      if (searched.charAt(0) == '<') {
        if (searched.length > 1) {
          searchedFloat = parseFloat(searched.substring(1));
          if (!(wine_searched_value < searchedFloat)) {
            $(this).parent().parent().hide();
          }
        }
      } else if (searched.charAt(0) == '>') {
        if (searched.length > 1) {
          searchedFloat = parseFloat(searched.substring(1));
          if (!(wine_searched_value > searchedFloat)) {
            $(this).parent().parent().hide();
          }
        }
      } else {
        if (!($(this).html() == searched)) {
          $(this).parent().parent().hide();
        }
      }
    });
  }
}

var columns = [
  { att: 'name',                displayed: true,  search_class: 'input-medium', filter: 'text_with_link' },
  { att: 'area',                displayed: true,  search_class: 'input-medium', filter: 'text_with_link' },
  { att: 'wine_color',          displayed: true,  filter: 'color'},
  { att: 'vintage',             displayed: true,  search_class: 'input-mini', filter: 'vintage' },
  { att: 'drink',               displayed: false, search_class: 'input-mini', filter: 'text' },
  { att: 'remaining_quantity',  displayed: true,  search_class: 'input-mini', filter: 'compare' },
  { att: 'price',               displayed: true,  search_class: 'input-mini', filter: 'compare' },
  { att: 'current_value',       displayed: false, search_class: 'input-mini', filter: 'compare' },
  { att: 'date',                displayed: false, search_class: 'input-mini', filter: 'text' },
  { att: 'channel',             displayed: false, search_class: 'input-mini', filter: 'text' },
  { att: 'chancomm',            displayed: false, search_class: 'input-mini', filter: 'text' },
  { att: 'comments',            displayed: false, search_class: 'input-mini', filter: 'text' }
];

function treat_column(att) {
  if ($("input#"+att+"_column").is(':checked')) {
    $("td[id*="+att+"]").show();
    $("th#"+att).show();
  } else {
    $("th#"+att).hide();
    $("td[id*="+att+"]").hide();
  }
}

function treat_columns() {
    for (var i = 0; i < columns.length; i++) {
      var c = columns[i];
      treat_column(columns[i]['att']);
      $("input#"+ c['att'] +"_column").change(treat_columns);
    }
}

function filter() {
  $("tr").each(function() {
    $(this).show();
  });
  
  for (var i = 0; i < columns.length; i++) {
    var c = columns[i];
    var funcCall = 'filter_' + c['filter'] + '("' + c['att'] + '")';
    eval(funcCall);
  }
}

$('.bottles.index').ready(function(){
  for (var i = 0; i < columns.length; i++) {
    var c = columns[i];
    $("input#" + c['att']).keyup(filter);
  }
  $("select#wine_color").change(filter);
    
  $("tr#bottle").click(function() {
    window.location = $(this).find("input").val();
  });
  
  $("select#racks").change(function(){
    var rack = $(this).val();
    if (rack == 0) {
      window.location = $('input#bottles_path').attr('value');
    } if (rack == -1) {
      window.location = $('input#not_placed_bottles_path').attr('value');
    } else {
      window.location = $('input#bottles_path').attr('value') + '?wine_rack_id=' + rack;
    }
  });
  
  treat_columns();
    
});
