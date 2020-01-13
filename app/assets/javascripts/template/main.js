$(function() {

  var windowHeight = $(window).height();
  // post slider
  $('.post-slider').slick({
    arrows: false,
    autoplay: true,
    dots: true,
    fade: false,
    slidesToShow: 3,
    centerMode: true,
    variableWidth: true,
  });
});
