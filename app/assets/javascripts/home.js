var masonryLoaded = false;

$(document).on('turbolinks:load', function () {
  if ($('.scroll-to').length) { setupSmoothScroll(); }
  if ($('#events-container').length) { setupMasonry(); }
});

$(document).on('initComplete.cbp', function() {
  masonryLoaded = true;
});

function setupSmoothScroll() {
  $('.scroll-to').click(function () {
    var link = $(this).attr('href').slice(1);
    var target = $(link);
    if (target.length) {
      $('html,body').animate({
          scrollTop: target.offset().top - 50
      }, 1000);
      return false;
    }
  });
}

function setupMasonry() {
  if (!masonryLoaded) {
    initMasonry();
  }
}

function initMasonry() {
  $('#events-container').cubeportfolio({
    layoutMode: 'grid',
    defaultFilter: '*',
    animationType: 'flipOutDelay',
    gapHorizontal: 20,
    gapVertical: 20,
    gridAdjustment: 'responsive',
    mediaQueries: [{
      width: 1100,
      cols: 4
    }, {
      width: 800,
      cols: 3
    }, {
      width: 500,
      cols: 2
    }, {
      width: 320,
      cols: 1
    }],
    caption: 'overlayBottomAlong',
    displayType: 'bottomToTop',
    displayTypeSpeed: 100
  });
}