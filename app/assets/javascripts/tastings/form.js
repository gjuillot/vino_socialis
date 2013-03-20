function tastings_form_ready() {
  $('#tasting_date').datepicker({
    format: 'dd/mm/yyyy',
    autoclose: 'true',
    language: $('#tasting_date').attr('locale')
  });
  
  ratyfy('tasting_note', 'tasting[note]', false);
  ratyfy('pairing_note', 'pairing[note]', true);
  ratyfy('eye_intensity_note', 'tasting[eye_intensity]', true);
  ratyfy('nose_intensity_note', 'tasting[nose_intensity]', true);
  ratyfy('nose_complexity_note', 'tasting[nose_complexity]', true);
  ratyfy('mouth_acidity_note', 'tasting[mouth_acidity]', true);
  ratyfy('mouth_bitterness_note', 'tasting[mouth_bitterness]', true);
  ratyfy('mouth_alcohol_note', 'tasting[mouth_alcohol]', true);
  ratyfy('mouth_sweet_note', 'tasting[mouth_sweet]', true);
  ratyfy('mouth_tanins_note', 'tasting[mouth_tanins]', true);
  ratyfy('mouth_co2_note', 'tasting[mouth_co2]', true);
  ratyfy('mouth_complexity_note', 'tasting[mouth_complexity]', true);
  ratyfy('mouth_persistence_note', 'tasting[mouth_persistence]', true);
  
  function ratyfy(id, name, cancel) {
    $('#' + id).raty({
      score : function() {
        return $(this).attr('data-score');
      },
      hints : eval($('#' + id).attr('data-hints')),
      scoreName : name,
      target : '#' + id + '_hint',
      cancel: cancel, 
      cancelHint: ''
    });
  }
}

$('.tastings.new').ready(tastings_form_ready);
$('.tastings.edit').ready(tastings_form_ready);
