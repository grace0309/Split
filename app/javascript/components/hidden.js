const hideItems = function() {
  if (document.querySelector(".wrapper-dash")) {
const wrap = document.querySelector(".wrapper-dash");
  wrap.addEventListener("click", function() {
    let class_active = document.querySelector('.active').text;

    if (class_active === "Ongoing") {
    let hidden = document.querySelector(".ongoing");
    hidden.classList.remove("hidden")
    let unhidden = document.querySelector(".history");
    unhidden.classList.add("hidden")
    let unhidden1 = document.querySelector(".favourites");
    unhidden1.classList.add("hidden")
    }

    if (class_active === "History") {
    let hidden = document.querySelector(".history");
    hidden.classList.remove("hidden")
    let unhidden = document.querySelector(".ongoing");
    unhidden.classList.add("hidden")
    let unhidden1 = document.querySelector(".favourites");
    unhidden1.classList.add("hidden")
    }

        if (class_active === "Favourites") {
    let hidden = document.querySelector(".favourites");
    hidden.classList.remove("hidden")
    let unhidden = document.querySelector(".ongoing");
    unhidden.classList.add("hidden")
    let unhidden1 = document.querySelector(".history");
    unhidden1.classList.add("hidden")
    }

  });
}
}


export { hideItems }
