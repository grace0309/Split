import ConfettiGenerator from "confetti-js";

function confetti() {
 const canvas = document.querySelector("#my-canvas")
 if ( canvas ) {
   canvas.style.display = "none";
   const completed = document.querySelector("#completed");
   if ( completed ) {
   completed.addEventListener("click", function() {
     canvas.style.display = "block";
     document.querySelector(".post-container").style.display = "none";
     var confettiSettings = { target: 'my-canvas' };
     var confetti = new ConfettiGenerator(confettiSettings);
     confetti.render();
     setTimeout(function() {
      canvas.style.display = "none";
      document.querySelector(".post-container").style.display = "block";
      }, 3000)
   });
 };
 }
}



export { confetti }
