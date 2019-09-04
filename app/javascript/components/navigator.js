var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;
  // document.querySelector("#lat_query").value = crd.latitude;
  // document.querySelector("#long_query").value = crd.longitude;
  console.log(crd)
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
}

const initNavigator = async function () {
  await navigator.geolocation.getCurrentPosition(success, error, options);
}

const bindNearby = function () {
  initNavigator();
  // const button = document.querySelector("#nearby")
  // button.addEventListener('click', (event) => {
  // // Do something (callback)
  //   const form = document.querySelector(".simple_form.search")
  //   setTimeout(function() {form.submit()},100)
  // });
}

export { bindNearby }
