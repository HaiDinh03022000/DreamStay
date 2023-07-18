function calculateTotal(month) {
    var price = detailPrice;
    var newPrice = price * month;
    // Cập nhật giá trị mới vào phần tử span
    document.getElementById('serviceFeeSpan').textContent = newPrice;   
    var total = newPrice;
    document.getElementById('totalSpan').textContent = total;
    // Cập nhật giá trị hidden input
    document.querySelector('input[name="amount"]').value = total;
    document.querySelector('input[name="total"]').value = total;
    formatNumberElements();
}


function formatNumberElements() {
    var numberElements = document.getElementsByClassName('number');

    for (var i = 0; i < numberElements.length; i++) {
        var number = parseInt(numberElements[i].textContent);
        var formattedNumber = number.toLocaleString('en-US');
        numberElements[i].textContent = formattedNumber;
    }
}

window.addEventListener('DOMContentLoaded', (event) => {
    const expirationInput = document.getElementById('expiration');

    expirationInput.addEventListener('input', function () {
        const input = expirationInput.value.replace(/\D/g, '');
        const month = input.slice(0, 2);
        const year = input.slice(2, 4);

        let formattedDate = '';
        if (month) {
            formattedDate += month;
        }
        if (year) {
            formattedDate += '/' + year;
        }

        expirationInput.value = formattedDate;
    });

    var numberElements = document.getElementsByClassName('number');

    for (var i = 0; i < numberElements.length; i++) {
        var number = parseInt(numberElements[i].textContent);
        var formattedNumber = number.toLocaleString('en-US');
        numberElements[i].textContent = formattedNumber;
    }

    function formatCardNumber() {
        var cardNumberInput = document.getElementById("number");
        var cardNumber = cardNumberInput.value;

        // Remove any non-numeric characters from the input
        cardNumber = cardNumber.replace(/\D/g, '');

        // Add dashes after every 4 characters
        if (cardNumber.length > 0) {
            cardNumber = cardNumber.match(new RegExp('.{1,4}', 'g')).join('-');
        }

        cardNumberInput.value = cardNumber;
    }

    document.getElementById("number1").addEventListener("input", formatCardNumber);
});
