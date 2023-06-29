function isNumber(event) {
    // Get the key code of the pressed key
    var keyCode = event.which ? event.which : event.keyCode;

    // Check if the key code is a number (0-9) or a special key
    if (keyCode >= 48 && keyCode <= 57 || keyCode === 8 || keyCode === 9 || keyCode === 37 || keyCode === 39) {
        return true; // Allow input
    } else {
        return false; // Prevent input
    }
}

function checkInputValue(numberInput,submitButton) {
    var input = document.getElementById(numberInput).value;
    var submitBtn = document.getElementById(submitButton);

    if (input !== "") {
      submitBtn.disabled = false; // Enable the submit button
    } else {
      submitBtn.disabled = true; // Disable the submit button
    }
  }




function openPopup() {
    document.getElementById("popup").style.display = "block";
    document.getElementById("overlay").style.display = "block";
}
function closePopup() {
    document.getElementById("popup").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}