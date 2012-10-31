$('.users.stat').ready(function() {
  d3.json("stat_json.json", function(json) {
    bargraph(json['areas'], 'div#areas');
    bargraph(json['colors'], 'div#colors');
    bargraph(json['vintages'], 'div#vintages');
  });
});