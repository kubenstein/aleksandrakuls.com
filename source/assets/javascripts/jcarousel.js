$(document).ready(function() {
  var delta = 5;

  $('.jcarousel').jcarousel();

  // prev button
  $('.jcarousel-control-prev')
    .on('jcarouselcontrol:active', function() { $(this).removeClass('hidden') })
    .on('jcarouselcontrol:inactive', function() { $(this).addClass('hidden') })
    .jcarouselControl({ target: '-='+delta });

  // prev next
  $('.jcarousel-control-next')
    .on('jcarouselcontrol:active', function() { $(this).removeClass('hidden') })
    .on('jcarouselcontrol:inactive', function() { $(this).addClass('hidden') })
    .jcarouselControl({ target: '+='+delta });

});
