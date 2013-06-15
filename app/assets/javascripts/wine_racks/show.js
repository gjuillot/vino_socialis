
lastFill = '';
green = '';

function highlight_circle(id) {
  console.log('highlight ' + id);
  if (!id) { return; }
  if ($("svg circle." + id).css('fill') != green) {
    lastFill = $("svg circle." + id).css('fill');
  }
  $("svg circle." + id).css('fill', 'green');
  green = $("svg circle." + id).css('fill');
}

function highlight_all(id) {
  if (!id) { return; }
  
  highlight_circle(id);
  
  $("table#list tr").each(function() {
    if ($(this).attr('id') == id) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function unhighlight(id) {
  console.log('unhighlight ' + id);
  if (!id) { return; }
  
  $("svg circle." + id).css('fill', lastFill);
  
  $("table#list tr").each(function() {
    $(this).show();
  });
}

function tr_hover_in() {
  if (one_bottle_selected()) { return; }
  highlight_circle($(this).attr('id'));
}

function tr_hover_out() {
  if (one_bottle_selected()) { return; }
  unhighlight($(this).attr('id'));
}

function tr_click() {
  bottle_click($(this), 'id');
}

function circle_hover_in() {
  if (one_bottle_selected()) { return; }
  highlight_all($(this).attr('class'));
}

function circle_hover_out() {
  if (one_bottle_selected()) { return; }
  unhighlight($(this).attr('class'));
}

function circle_click() {
  bottle_click($(this), 'class');
}

function actions_show(id) {
  $("div[class=well]").each(function() {
      if ($(this).attr('id') == id) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
}

function bottle_click(obj, param) {
  if (selected_bottle == '') {
    // no bottle was previous selected, so selected this one
    selected_bottle = obj.attr(param);
    highlight_all(selected_bottle);
    actions_show(selected_bottle);
  } else if (selected_bottle == obj.attr(param)) {
    // one bottle was previsous selected, unselect only if same has been clicked
    unhighlight(selected_bottle);
    $("div[class=well]").hide();
    highlight_circle(selected_bottle);
    selected_bottle = '';
  }
}

selected_bottle = '';

function one_bottle_selected() {
  return selected_bottle != '';
}

$('.wine_racks.show').ready(function() {
  // hover table row
  $("table#list tr").hover(tr_hover_in, tr_hover_out);
  
  // hover bottle image
  $("svg circle").hover(circle_hover_in, circle_hover_out);

  // click bottle image
  $("svg circle").click(circle_click);
  
  // click table row
  $("table#list tr").click(tr_click);
  
  $("div[class=well]").hide();
  
  $('#highlight').ready(function() {
    selected_bottle = $(this).attr('value');
    highlight_all(selected_bottle);
    actions_show(selected_bottle);
  });
});