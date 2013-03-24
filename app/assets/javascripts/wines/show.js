$('.wines.show').ready(function() {
  $('#sharrre').sharrre({
    share : {
      facebook : true,
      googlePlus : true,
      twitter : true
    },
    buttons : {
      facebook : {
        layout : 'button_count'
      },
      googlePlus : {
        size : 'medium'
      },
      twitter : {
        count : 'horizontal'
      }
    },
    enableHover : false,
    enableCounter : false
  });
});
