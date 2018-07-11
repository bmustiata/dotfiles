(function($) {

$('#echoButton').click(function() {
  var message = $('#message').val();

  $.ajax('/rest', {
    method: 'POST',
    data: {a: message},
    success: function(data) {
      console.log(data)
    },
    fail: function() {
      console.log('failed')
    }
  })
});

var socket = io.connect('ws://' + document.domain + ':' + location.port);
socket.on('connect', function() {
    console.log('connected')
    socket.emit('message', {data: 'I\'m connected!'});
});

socket.on('message', (data) => {
  console.log("message", data);
});



})(jQuery);
