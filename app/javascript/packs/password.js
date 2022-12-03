document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.pass-check')

  if (control) {
    control.addEventListener('input', passCheck)
  }

  function passCheck() {
    var password = document.getElementById('user_password')
    var confirmation = document.getElementById('user_password_confirmation')
    
    if (password.value === confirmation.value) {
      password.classList.add('border-green')
      confirmation.classList.add('border-green')
      password.classList.remove('border-red')
      confirmation.classList.remove('border-red')
    } else {
      password.classList.add('border-red')
      confirmation.classList.add('border-red')
      password.classList.remove('border-green')
      confirmation.classList.remove('border-green')
    }    
  }
})