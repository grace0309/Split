function calculate(i, endDate) {
    let days, hours, minutes, seconds;
    let startDate = Date.now();
    // console.log("calculating")

    // startDate = new Date(startDate.getUTCFullYear(),
    //   startDate.getUTCMonth(),
    //   startDate.getUTCDate(),
    //   startDate.getUTCHours(),
    //   startDate.getUTCMinutes(),
    //   startDate.getUTCSeconds());

    let timeRemaining = parseInt((endDate - startDate) / 1000);

    // console.log(timeRemaining)

    if (timeRemaining >= 0) {
      days            = parseInt(timeRemaining / 86400);
      timeRemaining   = (timeRemaining % 86400);

      hours           = parseInt(timeRemaining / 3600);
      timeRemaining   = (timeRemaining % 3600);

      minutes         = parseInt(timeRemaining / 60);
      timeRemaining   = (timeRemaining % 60);

      seconds         = parseInt(timeRemaining);
//
      // console.log( document.querySelectorAll(".hours"))
      // console.log(document.querySelectorAll(".hours")[i])
      // console.log(document.querySelectorAll(".hours")[i].innerHTML)
      // console.log(("0" + hours).slice(-2))
      // console.log()
      // console.log()


      document.querySelectorAll(".hours")[i].innerHTML   = ("0" + hours).slice(-2);
      document.querySelectorAll(".minutes")[i].innerHTML = ("0" + minutes).slice(-2);
      document.querySelectorAll(".seconds")[i].innerHTML = ("0" + seconds).slice(-2);
    }
  }


function countdown() {
  if (document.querySelectorAll('.end_time_data')) {

    let endDates = document.querySelectorAll('.end_time_data')
    let i;
    for (i = 0; i < endDates.length; i++) {
      let endDate = endDates[i].dataset.time;
      // console.log(endDate)

      endDate = new Date(endDate.replace(" ","T").replace(" +0800", "").concat('.000+08:00')).getTime();
      if (isNaN(endDate)) {
        return;
      }
      calculate(i, endDate)
  }
    }

  // timer = setInterval(calculate, 1000);
}

const timer = () => {
  setInterval(countdown, 1000);
}


export { timer }
