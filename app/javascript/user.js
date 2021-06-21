function pullDown() {

  const pullDownButton = document.getElementById("login-menus")
  const pullDownParents = document.getElementById("login-menu")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}

window.addEventListener('load', pullDown)