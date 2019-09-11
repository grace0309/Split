function selectorunhide() {
  if (document.querySelectorAll(".dash-icon")) {
    document.addEventListener("click", function(event) {
      if (event.target.classList[1] === "fa-times-circle") {
        let closebtn = event.target.parentElement.parentElement;
        closebtn.classList.remove("tail-shown")
        closebtn.classList.add("hidden")
      }
    });
  }
}

export { selectorunhide }
