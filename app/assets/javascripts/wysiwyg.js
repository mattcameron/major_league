$(document).on('turbolinks:load', function () {
  if ($('.tinymce').length) {
    tinymce.remove();
    tinyMCE.init({
      selector: 'textarea.tinymce',
      menubar: false,
      statusbar: false,
      toolbar: 'bold italic | undo redo | link',
      plugins: 'link'
    });
  }
});