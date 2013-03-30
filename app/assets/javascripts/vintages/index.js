$('.vintages.index').ready(function() {
  $('#vintage_note').raty({
      scoreName : "vintage[note]"
    });
  $(".vintage_note").each(function() {
    $(this).raty({
      score: function() {
        return $(this).attr('data-score');
      },
      readOnly: true
    });
  });
  
  jQuery.fn.dataTableExt.oSort['raty-asc']  = function(a,b) {
    if (a == '') {
      return 1;
    }
    if (b == '') {
      return -1;
    }
    var tmp = 'data-score="'
    var x = a.charAt(a.indexOf(tmp) + tmp.length)
    var y = b.charAt(b.indexOf(tmp) + tmp.length)
    x = parseFloat( x );
    y = parseFloat( y );
    return ((x < y) ? 1 : ((x > y) ?  -1 : 0));
  }
  jQuery.fn.dataTableExt.oSort['raty-desc']  = function(a,b) {
    if (a == '') {
      return 1;
    }
    if (b == '') {
      return -1;
    }
    var tmp = 'data-score="'
    var x = a.charAt(a.indexOf(tmp) + tmp.length)
    var y = b.charAt(b.indexOf(tmp) + tmp.length)
    x = parseFloat( x );
    y = parseFloat( y );
    return ((x < y) ? -1 : ((x > y) ?  1 : 0));
  }
  
  var oTable = $('.dataTable').dataTable({
    "bFilter": false,
    "bInfo": false,
    "bPaginate": false,
    "bAutoWidth": true,
    "bPaginate": false,
    "aaSorting": [[ 0, "desc" ]],
    "sPaginationType": "bootstrap",
    "sScrollX": "100%",
    "aoColumnDefs": [{"sType": "raty", "aTargets": ["raty"]}]
  });
  new FixedColumns( oTable, {
    "iLeftColumns": 1,
    "iLeftWidth": 50
  });
  
});

