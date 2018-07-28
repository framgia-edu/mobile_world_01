$(document).on('turbolinks:load', function(){
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('#scroll_top').fadeIn();
    } else {
      $('#scroll_top').fadeOut();
    }
  });
  $('#scroll_top').click(function(){
    $('html, body').animate({scrollTop: 0}, 600);
    return false;
  });
});
