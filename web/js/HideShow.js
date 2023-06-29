
document.addEventListener("DOMContentLoaded", function () {
    toggleCard('cardContainer1', 'toggleButton1'); // Gọi toggleCard() để cập nhật trạng thái hiển thị ban đầu
    toggleCard('cardContainer2', 'toggleButton2');
    toggleCard('cardContainer3', 'toggleButton3');
    toggleCard('cardContainer4', 'toggleButton4');
});

function toggleCard(cardContainerId, toggleButtonId) {
    var cardContainer = document.getElementById(cardContainerId);
    var toggleButton = document.getElementById(toggleButtonId);

    if (cardContainer.style.display === "none") {
        // Nếu phần tử đang ẩn, hiển thị nó và thay đổi văn bản của nút
        cardContainer.style.display = "block";
        toggleButton.textContent = "Hide";
    } else {
        // Nếu phần tử đang hiển thị, ẩn nó và thay đổi văn bản của nút
        cardContainer.style.display = "none";
        toggleButton.textContent = "Show";
    }
}

//function updateLinkHref(extendInputId, link) {
//    var link = document.getElementById(link);
//    var input = document.getElementById(extendInputId);
//    var currentHref = link.getAttribute("href");
//    var value = "";
//
//    input.addEventListener("input", function() {
//        value = input.value;
//        link.href = currentHref + value;
//    });
//}



