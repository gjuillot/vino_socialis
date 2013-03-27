$('.home.discover').ready(function() {
  $(".vintage_note").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      readOnly: true
    });
  });
});

