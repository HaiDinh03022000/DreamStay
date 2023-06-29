var numberInput = document.getElementById('numberInput');

numberInput.addEventListener('input', function (e) {
    var input = e.target.value.replace(/-/g, '').replace(/\s/g, '');
    var formatted = '';

    for (var i = 0; i < input.length; i++) {
        if (i > 0 && i % 4 === 0) {
            formatted += ' ';
        }

        formatted += input[i];
    }

    e.target.value = formatted;
});

var numberElements = document.getElementsByClassName('number');

for (var i = 0; i < numberElements.length; i++) {
    var number = parseInt(numberElements[i].textContent);
    var formattedNumber = number.toLocaleString('en-US');
    numberElements[i].textContent = formattedNumber;
}