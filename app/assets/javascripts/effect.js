$(document).ready(function(){
  var eTop = $('.zoom-images').offset().top;
  $(window).scroll(function() {
    if(eTop - $(window).scrollTop() > "-982"){
      $('.zoom-images').css('opacity', '1');
    }
  });
});
