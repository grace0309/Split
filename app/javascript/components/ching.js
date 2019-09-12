const ching = function() {
  if (document.querySelector(".post-btn")) {
    const a = new Audio("https://res.cloudinary.com/dtsg1dlrd/video/upload/v1568109541/ching_hi8asp.wav");
    const btn = document.querySelector(".post-btn");
    btn.addEventListener("onclick", (event) => {
    a.play();
    });
    btn.addEventListener("ontouchstart", (event) => {
    a.play();
    });

  }
}

export { ching }
