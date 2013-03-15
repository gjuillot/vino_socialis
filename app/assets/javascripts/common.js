String.prototype.startsWith = function(needle)
{
    return(this.indexOf(needle) == 0);
};

$(document).ready(function() {
  $(".action-button-group > a").each(function() {
    id = $(this).attr('id')
    $('span[id=' + id + ']').hide();
    $(this).hover(
      function() {
        id = $(this).attr('id')
        $('span[id=' + id + ']').show();
      },
      function() {
        id = $(this).attr('id')
        $('span[id=' + id + ']').hide();
      }
    )
  });
});
