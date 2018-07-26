var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var mySlides = document.getElementsByClassName('mySlides');
  var dots = document.getElementsByClassName('dot');
  for (i = 0; i < mySlides.length; i++) {
    mySlides[i].style.display = 'none';
  }
  slideIndex++;
  if (slideIndex > mySlides.length) { slideIndex = 1 }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(' active', '');
  }
  mySlides[slideIndex - 1].style.display = 'block';
  dots[slideIndex - 1].className += ' active';
  setTimeout(showSlides, 3000);
}
