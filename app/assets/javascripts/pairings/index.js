function pairings_ready() {
  $(".star").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      hints: ['','','','',''],
      readOnly: true
    });
  });
}

$('.pairings.index').ready(pairings_ready);
$('.pairings.search').ready(pairings_ready);