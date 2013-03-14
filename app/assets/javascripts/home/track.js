$('.home.track').ready(function(){
  $("#myCarousel").carousel('pause');
  $("#p1").mouseover(function(){slide(0);});
  $("#p2").mouseover(function(){slide(1);});
  $("#p3").mouseover(function(){slide(2);});
  $("#p4").mouseover(function(){slide(3);});
  $("#p5").mouseover(function(){slide(4);});
  $("#p6").mouseover(function(){slide(5);});
});

function slide(i) {
  $("#myCarousel").carousel(i);
}
