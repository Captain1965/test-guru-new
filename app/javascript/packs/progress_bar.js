document.addEventListener('turbolinks:load', function () {
   let control = document.querySelector('.progress-bar')

   if (control) {
    showProgress(control)
   }
   
   function showProgress(control) {
    let persent = control.dataset.progress 
    control.style.width = persent + '%'  
   }
});
