$('.consumptions.index').ready(function() {
  $('.dataTable').dataTable({
    "bSort": false,
    "oLanguage": dataTableLang[$('.dataTable').data('lang')]
  });
});

