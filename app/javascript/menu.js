function mainNav() {

  const btn = document.querySelector('.btn-menu');
  const nav = document.querySelector('.main-nav');
  btn.addEventListener('click', () => {
    nav.classList.toggle('open-menu');
    if (btn.innerHTML === '<i class="fa fa-bars" id="open"></i>') {
      btn.innerHTML = '<i class="fa fa-times" id="close"></i>';
    } else {
      btn.innerHTML = '<i class="fa fa-bars" id="open"></i>';
    }
  });
}

window.addEventListener('load', mainNav)