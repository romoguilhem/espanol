document.addEventListener("DOMContentLoaded", function() {
  document.querySelector("form").addEventListener("submit", function(event) {
    event.preventDefault();

    let formData = new FormData(this);
    console.log(formData);
  });
});
