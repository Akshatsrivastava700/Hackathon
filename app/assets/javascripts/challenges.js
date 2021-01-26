
function showChallengeForm(){
  var form = document.getElementById("add-challenge-form-container");
  var btn = document.getElementById("add-challenge-btn");
  var span = document.getElementsByClassName("close")[0];

  btn.onclick = function() {
    form.style.display = "block";
  }


  span.onclick = function() {
    form.style.display = "none";
  }


  window.onclick = function(event) {
    if (event.target == form) {
      form.style.display = "none";
    }
  }
}
