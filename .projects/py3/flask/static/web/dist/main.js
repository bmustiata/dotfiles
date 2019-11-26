(function($) {

$('#echoButton').click(function() {
  var message = $('#message').val();

  $.ajax('/rest', {
    method: 'POST',
    data: {a: message},
    success: function(data) {
      $('#echoMessage').text(data);
    },
    fail: function() {
      alert('failed');
    }
  })
});

})(jQuery);
