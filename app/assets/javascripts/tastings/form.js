function tastings_form_ready() {
  $('#tasting_date').datepicker({
    format: 'dd/mm/yyyy',
    autoclose: 'true',
    language: $('#tasting_date').attr('locale')
  });
}

$('.tastings.new').ready(tastings_form_ready);
$('.tastings.edit').ready(tastings_form_ready);
