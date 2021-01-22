window.addEventListener('load', () => {
  var px_change = 200;
  const toTop = document.getElementById("to-top");
  toTop.classList.remove("to-top");
  window.addEventListener('scroll', () => {
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	if ( scrollTop > px_change ) {
    toTop.classList.add("to-top");
  } else {
    toTop.classList.remove("to-top");
  }
  });
  toTop.addEventListener('click', (e) => {
    scrollTo(0,0),
    e.preventDefault();
  });
});