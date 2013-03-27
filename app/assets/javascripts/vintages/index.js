$('.vintages.index').ready(function() {
  $('#vintage_note').raty({
      scoreName : "vintage[note]"
    });
  $(".vintage_note").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      readOnly: true
    });
  });
});

