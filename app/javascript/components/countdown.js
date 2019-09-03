function countdown() {
  if (document.querySelectorAll('.end_time_data')) {
  let timer, days, hours, minutes, seconds;

  document.querySelectorAll('.end_time_data').forEach((endTime)=>{
    let endDate = endTime.dataset.time
    endDate = new Date(endDate).getTime();
    let counter = []
    counter.push(endDate)
    let i = counter.length

  if (isNaN(endDate)) {
    return;
  }

  timer = setInterval(calculate, 1000);

  function calculate() {
    let startDate = new Date();

    startDate = new Date(startDate.getUTCFullYear(),
      startDate.getUTCMonth(),
      startDate.getUTCDate(),
      startDate.getUTCHours(),
      startDate.getUTCMinutes(),
      startDate.getUTCSeconds());

    let timeRemaining = parseInt((endDate - startDate.getTime()) / 1000);

    if (timeRemaining >= 0) {
      days            = parseInt(timeRemaining / 86400);
      timeRemaining   = (timeRemaining % 86400);

      hours           = parseInt(timeRemaining / 3600);
      timeRemaining   = (timeRemaining % 3600);

      minutes         = parseInt(timeRemaining / 60);
      timeRemaining   = (timeRemaining % 60);

      seconds         = parseInt(timeRemaining);

      document.querySelectorAll(".hours")[i].innerHTML   = ("0" + hours).slice(-2);
      document.querySelectorAll(".minutes")[i].innerHTML = ("0" + minutes).slice(-2);
      document.querySelectorAll(".seconds")[i].innerHTML = ("0" + seconds).slice(-2);
    } else {
      return;
    }
  }
  })
  };
}

export { countdown }
