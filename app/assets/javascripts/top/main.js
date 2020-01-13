$(function() {

// scroll nav
  var windowHeight = $(window).height();
  $(window).resize(function() {
    windowHeight = $(window).height();
  });
  $(window).scroll(function() {
    var scrollPos = $(window).scrollTop();
    if(scrollPos > windowHeight) {
      $('.top-nav').addClass('bg-dark');
    } else {
      $('.top-nav').removeClass('bg-dark');
    }
  });

  // top hover
  $('.item-box').each(function() {
    $(this).on('mouseover', function() {
      $(this).find('.overlay').stop(true).animate({ opacity: 1 }, 300);
    }).on('mouseout', function() {
      $(this).find('.overlay').stop(true).animate({ opacity: 0 }, 300);
    })
  });
});
