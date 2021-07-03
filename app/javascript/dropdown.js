function pullDown() {

  const pullDownButton = document.getElementById("dropdown")
  const pullDownParents = document.getElementById("dropdown-list")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}

window.addEventListener('load', pullDown)