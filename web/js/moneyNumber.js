
  // Get the reference to the <h3> element
  var numberElement = document.getElementById("number");
  
  // Get the number value from the element
  var numberValue = numberElement.innerHTML;
  
  // Format the number with commas
  var formattedNumber = numberValue.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
  // Update the content of the <h3> element with the formatted number
  numberElement.innerHTML = formattedNumber;
  
  
  
  
