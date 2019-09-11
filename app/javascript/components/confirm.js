function selectorhide() {
  if (document.querySelectorAll(".dash-icon")) {
    document.addEventListener("click", function(event) {
      if (event.target.classList.value === "dash-icon" ) {
        let btn = event.target.parentElement.parentElement.parentElement.parentElement
        let btn2 = btn.querySelector(".tail")
        btn2.classList.remove("hidden")
        btn2.classList.add("tail-shown")
      }
    });
  }
}

export { selectorhide }
