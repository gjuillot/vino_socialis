$('.areas.show').ready(function() {
  $('div.pie').each(function() {
    ay.pie_chart($(this).attr('id'), $(this).data('json'), 250);
  });
});
