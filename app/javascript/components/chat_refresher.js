const refresh = function() {
  if (document.getElementById('messages')) {
    location.reload()
  }
}

const refreshtimer = () => {
  setInterval(refresh, 1000);
}

export { refreshtimer }
