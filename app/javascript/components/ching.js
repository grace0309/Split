const ching = function() {
  if (document.querySelector(".ching")) {
    const a = new Audio("https://res.cloudinary.com/dtsg1dlrd/video/upload/v1568109541/ching_hi8asp.wav");
    const btn = document.querySelector(".ching");
    btn.addEventListener("click", (event) => {
    a.play();
    });
  }
}

export { ching }
