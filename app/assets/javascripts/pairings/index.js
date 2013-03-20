$('.pairings.index').ready(function(){
  $(".star").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      hints: ['','','','',''],
      readOnly: true
    });
  });
});
