import "bootstrap";
import { toggleDateInputs } from '../components/calender';
toggleDateInputs()

import { timer } from '../components/countdown';
timer()

import { progress } from '../components/progress_bar';
progress()

import { dashboardnav } from '../components/dashboardnav'
dashboardnav()

import { hideItems } from '../components/hidden'
hideItems()

import { display } from '../components/displaypic'
display()

import { bindNearby } from '../components/navigator';
bindNearby();

import { ching } from '../components/ching';
ching();

import ConfettiGenerator from "confetti-js";

const canvas = document.querySelector("#my-canvas")
if ( canvas ) {
  canvas.style.display = "none";
  const completed = document.querySelector("#completed");
  completed.addEventListener("click", function() {
    var confettiSettings = { target: 'my-canvas' };
    var confetti = new ConfettiGenerator(confettiSettings);
    confetti.render();
  });
}

