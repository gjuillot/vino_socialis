blinkId = '';

function highlight_img(id) {
  if (!id) { return; }
  window.clearInterval(blinkId);
  blinkId = window.setInterval("$('table#graphical td#" + id + " img').toggle();", 500);
}

function highlight_all(id) {
  if (!id) { return; }
  
  highlight_img(id);
  
  $("table#list tr").each(function() {
    if ($(this).attr('id') == id) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function unhighlight(id) {
  if (!id) { return; }
  
  window.clearInterval(blinkId);
  $("table#graphical td#" + id + " img").show();
  
  $("table#list tr").each(function() {
    $(this).show();
  });
}

function tr_hover_in() {
  if (one_bottle_selected()) { return; }
  highlight_img($(this).attr('id'));
}

function tr_hover_out() {
  if (one_bottle_selected()) { return; }
  unhighlight($(this).attr('id'));
}

function img_hover_in() {
  if (one_bottle_selected()) { return; }
  highlight_all($(this).attr('id'));
}

function img_hover_out() {
  if (one_bottle_selected()) { return; }
  unhighlight($(this).attr('id'));
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

function bottle_click() {
  if (selected_bottle == '') {
    // no bottle was previous selected, so selected this one
    selected_bottle = $(this).attr('id');
    highlight_all(selected_bottle);
    actions_show(selected_bottle);
  } else {
    // one bottle was previsous selected, unselect only if same has been clicked
    if (selected_bottle == $(this).attr('id')) {
      unhighlight(selected_bottle);
      $("div[class=well]").hide();
      selected_bottle = '';
    }
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
  $("table#graphical td").hover(img_hover_in, img_hover_out);
  
  // click bottle image
  $("table#graphical table td").click(bottle_click);
  
  // click table row
  $("table#list tr").click(bottle_click);
  
  $("div[class=well]").hide();
  
  $('#highlight').ready(function() {
    selected_bottle = $(this).attr('value');
    highlight_all(selected_bottle);
    actions_show(selected_bottle);
  });
});