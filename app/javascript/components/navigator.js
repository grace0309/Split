var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;
  window.lat = crd.latitude;
  window.long = crd.longitude;
  // document.querySelector("#lat_query").value = crd.latitude
  // document.querySelector("#long_query").value = crd.longitude
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
}

const initNavigator = async function () {
  await navigator.geolocation.getCurrentPosition(success, error, options);
}

const bindNearby = function () {
  initNavigator();
  const button = document.querySelector("#nearby")
  button.addEventListener('click', (event) => {
  // Do something (callback)
    document.querySelector("#lat_query").value = window.lat
    document.querySelector("#long_query").value = window.long
    const form = document.querySelector(".simple_form.search")
    setTimeout(function() {form.submit()},300)
  });
}

export { bindNearby }
