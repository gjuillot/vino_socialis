$('.books.show').ready(function() {
  $('#book_rating_note').raty({
    score: function() {
      return $(this).attr('data-score');
    },
    scoreName : 'book_rating[note]',
  });
    
  $(".star").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      readOnly: true
    });
  });
});