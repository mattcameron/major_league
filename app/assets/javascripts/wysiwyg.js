$(document).on('turbolinks:load', function () {
  if ($('.rte').length) {
    $('.rte').froalaEditor();
  }
});