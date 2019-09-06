const hideItems = function() {
  if (document.querySelector(".wrapper")) {
const wrap = document.querySelector(".wrapper");
  wrap.addEventListener("click", function() {
    let class_active = document.querySelector(".active").innerText;

    if (class_active === "ONGOING") {
    let hidden = document.querySelector(".ongoing");
    hidden.classList.remove("hidden")
    let unhidden = document.querySelector(".history");
    unhidden.classList.add("hidden")
    }

    if (class_active === "HISTORY") {
    let hidden = document.querySelector(".history");
    hidden.classList.remove("hidden")
    let unhidden = document.querySelector(".ongoing");
    unhidden.classList.add("hidden")
    }

    if (class_active === "USER REVIEW") {
    let unhidden = document.querySelector(".ongoing");
    unhidden.classList.add("hidden");
    let unhidden_1 = document.querySelector(".history");
    unhidden_1.classList.add("hidden");
    }
  });
}
}


export { hideItems }
