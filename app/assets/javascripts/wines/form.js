$('.wines.new').ready(function(){
    $("select#region_id").change(function(){
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("select#wine_area_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("select#wine_area_id");
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
                    $("select#wine_area_id option").remove('option[value!=""]');
                    // Fill sub category select
                    $.each(data, function(i, j){
                        row = "<option value=\"" + j.id + "\">" + j.name + "</option>";  
                        $(row).appendTo("select#wine_area_id");                    
                    });
                 }
            });
        };
    });
});