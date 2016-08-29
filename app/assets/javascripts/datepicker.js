$(document).on('turbolinks:load', function() {
  if ($('.datepicker').length) { setupDatepicker(); }
  // if ($('.timepicker').length) { setupTimepicker(); }
});


function setupDatepicker() {
 $('.datepicker').datepicker({
  autoclose: true,
  assumeNearbyYear: true,
  format: 'dd-MM-yyyy'
 });

 $('.input-group-addon').click(function() {
    if( $(this).children('.fa-calendar').length ) {
      var nearestDatepicker = $(this).siblings('.datepicker');
      if (nearestDatepicker.length) {
        nearestDatepicker.datepicker('show');
      }
    }
 })
}

// function setupTimePicker() {

// }