$('.users.stat').ready(function() {
  
  var areas = false;
  var colors = false;
  var vintages = false;
  var purchase_years = false;
  var consumptions = false;
  
  $('#myTab a[href="#areas"]').click(function() {
    if (!areas) {
      d3.json("stat.json?areas=true", function(json) {
        bargraph(json, 'div#areas', null);
      });
      areas = true;
    }
  });
  
  $('#myTab a[href="#colors"]').click(function() {
    if (!colors) {
      d3.json("stat.json?colors=true", function(json) {
        bargraph(json, 'div#colors', null);
      });
      colors = true;
    }
  });
  
  $('#myTab a[href="#vintages"]').click(function() {
    if (!vintages) {
      d3.json("stat.json?vintages=true", function(json) {
        bargraph(json, 'div#vintages', function(a,b) { return d3.ascending(a.name, b.name);});
      });
      vintages = true;
    }
  });
  
  $('#myTab a[href="#purchase_years"]').click(function() {
    if (!purchase_years) {
      d3.json("stat.json?purchase_years=true", function(json) {
        bargraph(json, 'div#purchase_years', function(a,b) { return d3.ascending(a.name, b.name);});
      });
      purchase_years = true;
    }
  });
  
  $('#myTab a[href="#consumptions"]').click(function() {
    if (!consumptions) {
      d3.json("stat.json?consumptions=true", function(json) {
        bargraph(json, 'div#consumptions', null);
      });
      consumptions = true;
    }
  });
  
});

