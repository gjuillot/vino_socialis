function drink_results() {
  var vintage = $("select#bottle_vintage").val();
  if (vintage == 0) {
    $("span#drink_best_result").html('-');
  } else {
    var drink_min = $("input#bottle_drink_min").val();
    if (drink_best == '') {
      $("span#drink_min_result").html('-');
    } else {
      $("span#drink_min_result").html(parseInt(vintage) + parseInt(drink_min));
    }
    var drink_max = $("input#bottle_drink_max").val();
    if (drink_max == '') {
      $("span#drink_max_result").html('-');
    } else {
      $("span#drink_max_result").html(parseInt(vintage) + parseInt(drink_max));
    }
    var drink_best = $("input#bottle_drink_best").val();
    if (drink_best == '') {
      $("span#drink_best_result").html('-');
    } else {
      $("span#drink_best_result").html(parseInt(vintage) + parseInt(drink_best));
    }
  }
}

function bottles_form_ready() {
  $("input#bottle_price").focus(function() {
    if ($(this).val() == '0.00') {
      $(this).val('');
    }
  });
  $("input#bottle_current_value").focus(function() {
    if ($(this).val() == '0.00') {
      $(this).val('');
    }
  });
  $("input#bottle_price").keyup(function(){
    var price = $(this).val();
    var current_value_input = $("input#bottle_current_value");
    var current_value = current_value_input.val();
    if ((current_value_input.val() == '0.00') || (price.startsWith(current_value)) || (current_value.startsWith(price))) {
      current_value_input.val(price);
    }
  });
  $("select#bottle_vintage").change(drink_results);
  $("input#bottle_drink_min").keyup(drink_results);
  $("input#bottle_drink_max").keyup(drink_results);
  $("input#bottle_drink_best").keyup(drink_results);
  
  $('#drink_min_max_hint').popover();
  $('#drink_best_hint').popover();
  
  drink_results();
}

$('.bottles.new').ready(bottles_form_ready);
$('.bottles.edit').ready(bottles_form_ready);
