window.addEventListener('load', () => {
  const toTop = document.getElementById("to-top");
  const displayOriginal = toTop.style.display;
  toTop.style.display = 'none';
  var px_change = 200;
  window.addEventListener('scroll', () => {
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	if ( scrollTop > px_change ) {
    toTop.style.display = displayOriginal;
  } else {
    toTop.style.display = 'none';
  }
  });
  toTop.addEventListener('click', (e) => {
    scrollTo(0,0),
    e.preventDefault();
  });
});