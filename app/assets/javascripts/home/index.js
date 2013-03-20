$('.home.index').ready(function(){
  $("#myCarousel").carousel('pause');
  $("#why").mouseover(function(){slide(0);});
  $("#discover").mouseover(function(){slide(1);});
  $("#track").mouseover(function(){slide(2);});
  $("#share").mouseover(function(){slide(3);});
  
  $(".star").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      readOnly: true
    });
  });
});

function slide(i) {
  $("#myCarousel").carousel(i);
}
