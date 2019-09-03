const progress = function() {
  if (document.querySelector('.total_contribution')) {

    const contributions = document.querySelectorAll('.total_contribution');
    const quotas = document.querySelectorAll('.quota');
    let i

    for (i = 0; i < contributions.length; i++) {
      const contribution = contributions[i].dataset.contribution
      const quota = quotas[i].dataset.quota
      console.log(contribution)
      console.log(quota)
      let percentage = Math.round((contribution/quota)*100)
      console.log(percentage)
      document.querySelectorAll('.progress-bar')[i].style.width = percentage + "%"
      document.querySelectorAll('.progress-bar')[i].innerHTML = percentage + "%"
    }
  }
}

export { progress }
