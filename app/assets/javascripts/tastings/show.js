$('.tastings.show').ready(function() {
  ratyfy('tasting_note');
  ratyfy('pairing_note');
  ratyfy('eye_intensity_note');
  ratyfy('nose_intensity_note');
  ratyfy('nose_complexity_note');
  ratyfy('mouth_acidity_note');
  ratyfy('mouth_bitterness_note');
  ratyfy('mouth_alcohol_note');
  ratyfy('mouth_sweet_note');
  ratyfy('mouth_tanins_note');
  ratyfy('mouth_co2_note');
  ratyfy('mouth_complexity_note');
  ratyfy('mouth_persistence_note');
  
  function ratyfy(id, cancel) {
    $('#' + id).raty({
      score : function() {
        return $(this).attr('data-score');
      },
      hints : eval($('#' + id).attr('data-hints')),
      readOnly: true
    });
  }
});

