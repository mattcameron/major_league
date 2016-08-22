$(document).on('turbolinks:load', function () {
  //sticky header on scroll
  $(window).resize(function () {
    $(".navbar-collapse").css({
      maxHeight: $(window).height() - $(".navbar-header").height() + "px"
    });
  });
  $(".sticky").sticky({topSpacing: 0});

  //Auto Close Responsive Navbar on Click
  close_toggle();
  $(window).resize(close_toggle);

  // Parallax Sections
  $('.numbers').parallax("50%", 0.5);
  $('.process').parallax("50%", 0.5);
  $('.call-to-action').parallax("50%", 0.5);

  //News owl carousel
  $("#owl-news").owlCarousel({
      autoPlay: 6000, //Set AutoPlay to 3 seconds
      items: 3,
      itemsDesktop: [1199, 3],
      itemsDesktopSmall: [979, 2],
      itemsMobile: [479, 1],
      navigation: true,
      pagination: false,
      navigationText: ["<i class='fa fa-long-arrow-left'></i>", "<i class='fa fa-long-arrow-right'></i>"]
  });
});

function close_toggle() {
  if ($(window).width() <= 768) {
    $('.navbar-collapse a').on('click', function () {
        $('.navbar-collapse').collapse('hide');
    });
  }
  else {
    $('.navbar .navbar-default a').off('click');
  }
}