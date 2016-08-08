//smooth scroll
$(document).on('ready page:load', function () {
  $('.scroll-to').click(function () {
    var link = $(this).attr('href');
    var target = $(link);
    if (target.length) {
      $('html,body').animate({
          scrollTop: target.offset().top - 50
      }, 1000);
      return false;
    }
  });
});