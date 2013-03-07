$('.wines_and_estates.index').ready(wines_and_estates_ready);
$('.wines_and_estates.search').ready(wines_and_estates_ready);
  
function wines_and_estates_ready() {
  $("select#region_id").change(function(){
      var id_value_string = $(this).val();
      if (id_value_string == "") {
          $("select#area_id").hide();
      }
      else {
          // Send the request and update sub category dropdown
          $.ajax({
              dataType: "json",
              cache: false,
              url: '/areas/for_region_id/' + id_value_string,
              timeout: 2000,
              error: function(XMLHttpRequest, errorTextStatus, error){
                  alert("Failed to submit : "+ errorTextStatus+" ;"+error);
              },
              success: function(data){                    
                  // Clear all options from sub category select
                  $("select#area_id option").remove('option[value!=""]');
                  // Fill sub category select
                  $.each(data, function(i, j){
                      row = "<option value=\"" + j.id + "\">" + j.name + "</option>";  
                      $(row).appendTo("select#area_id");                    
                  });
                  $("select#area_id").show();
               }
          });
      };
  });
    
  $("input#q").click(function(){
    $(this).val('');
  });
    
  $("input#q").keyup(function(){
    if ($(this).val().length > 0) {
      $("select#scope").show();
      if ($(this).val().length > 5) {
        $('div#suggest_shorter_search').show();
      } else {
        $('div#suggest_shorter_search').hide();
      }
    } else {
      $("select#scope").hide();
    }
  });
  
  $("select#scope").change(function(){
    if($(this).val() == 'wine') {
      $("select#region_id").show();
      if ($("select#region_id").val() != '') {
        $("select#area_id").show();
      }
    } else {
      $("select#region_id").hide();
      $("select#area_id").hide();
    }
  });
  
  $('.load_hidden').hide();
}