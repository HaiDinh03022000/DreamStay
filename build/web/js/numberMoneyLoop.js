
  // Get all elements with class "number"
  var numberElements = document.getElementsByClassName("number");
  
  // Iterate over each element
  for (var i = 0; i < numberElements.length; i++) {
    // Get the current number element
    var numberElement = numberElements[i];
    
    // Get the number value from the element
    var numberValue = numberElement.innerHTML;
    
    // Format the number with commas
    var formattedNumber = numberValue.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    // Update the content of the element with the formatted number
    numberElement.innerHTML = formattedNumber;
  }
