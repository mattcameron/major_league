$(document).on('ready page:load', function() {
  if ($('#clock').length) {
    startCountdown('2017/01/01');
  }
});


function startCountdown(finishTime) {
  $('#clock').countdown('2017/02/01', function (event) {
    $('#weeks').html(event.strftime('%w'));
    $('#days').html(event.strftime('%d'));
    $('#hours').html(event.strftime('%H'));
    $('#mins').html(event.strftime('%M'));
    $('#secs').html(event.strftime('%S'));
  });
}
