$('.users.stat').ready(function() {
  
  $('div.progress').hide();
  
  var already_done = {};
  
  function load_bargraph(name, comparator) {
    if (!already_done[name]) {
      $('div.progress').show();
      d3.json("stat.json?" + name + "=true", function(json) {
        bargraph(json, 'div#' + name, comparator);
        $('div.progress').hide();
      });
      already_done[name] = true;
    }
  }
  
  $('#myTab a[href="#areas"]').click(function() {
    load_bargraph('areas', null);
  });
  
  $('#myTab a[href="#colors"]').click(function() {
    load_bargraph('colors', null);
  });
  
  $('#myTab a[href="#vintages"]').click(function() {
    load_bargraph('vintages', function(a,b) { return d3.ascending(a.name, b.name);});
  });
  
  $('#myTab a[href="#purchase_years"]').click(function() {
    load_bargraph('purchase_years', function(a,b) { return d3.ascending(a.name, b.name);});
  });
  
  $('#myTab a[href="#consumptions"]').click(function() {
    load_bargraph('consumptions', null);
  });
  
});

