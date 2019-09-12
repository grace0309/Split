import ConfettiGenerator from "confetti-js";

function confetti() {
 const canvas = document.querySelector("#my-canvas")
 if ( canvas ) {
   canvas.style.display = "none";
   document.querySelector(".pyro").style.display = "none"
   document.querySelector("#celebration-message").style.display = "none"
   document.querySelector("#background-wrap").style.display = "none"
   const completed = document.querySelector("#completed");
   if ( completed ) {
   completed.addEventListener("click", function() {
     document.querySelector(".post-container").style.display = "none";
     document.querySelector(".post-img").style.display = "none";
     const music = new Audio("https://res.cloudinary.com/dtsg1dlrd/video/upload/v1568260717/Celebration_but_sokf8r.mp3");
     music.play();
     canvas.style.display = "block";
     document.querySelector("#celebration-message").style.display = "block"
     var confettiSettings = { target: 'my-canvas' };
     var confetti = new ConfettiGenerator(confettiSettings);
     confetti.render();
     document.querySelector(".pyro").style.display = "block"
     document.querySelector("#background-wrap").style.display = "block"
     setTimeout(function() {
      canvas.style.display = "none";
      document.querySelector("#celebration-message").style.display = "none"
      document.querySelector(".post-container").style.display = "block";
      document.querySelector(".post-img").style.display = "block";
      document.querySelector(".pyro").style.display = "none"
      document.querySelector("#background-wrap").style.display = "none"
      }, 13000)
   });
 };
 }
}

export { confetti }
