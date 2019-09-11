const ching = function() {
  if (document.querySelector(".post-btn")) {
    const a = new Audio("https://res.cloudinary.com/dtsg1dlrd/video/upload/v1568109541/ching_hi8asp.wav");
    const btn = document.querySelector(".post-btn");
    btn.addEventListener("click", (event) => {
    a.play();
    });
    btn.addEventListener("touchstart", (event) => {
    a.play();
    });

  }
}

export { ching }
