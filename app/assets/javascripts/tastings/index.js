function tastings_list_ready() {
  $(".star").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      hints: ['','','','',''],
      readOnly: true
    });
  });
};

$('.tastings.index').ready(tastings_list_ready);
$('.tastings.me').ready(tastings_list_ready);