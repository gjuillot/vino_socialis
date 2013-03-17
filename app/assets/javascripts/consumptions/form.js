function consumptions_form_ready() {
  $('#consumption_date').datepicker({
    format: 'dd/mm/yyyy',
    autoclose: 'true',
    language: $('#consumption_date').attr('locale')
  });
}

$('.consumptions.new').ready(consumptions_form_ready);
$('.consumptions.edit').ready(consumptions_form_ready);
