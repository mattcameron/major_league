$(document).on('turbolinks:load', function() {
  if ($('#clock').length) {
    startCountdown();
  }
});


function startCountdown() {
  var startDate = $('#clock').data('date');
  $('#clock').countdown(startDate, function (event) {
    $('#weeks').html(event.strftime('%w'));
    $('#days').html(event.strftime('%d'));
    $('#hours').html(event.strftime('%H'));
    $('#mins').html(event.strftime('%M'));
    $('#secs').html(event.strftime('%S'));
  });
}
