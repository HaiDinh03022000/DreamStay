$(document).ready(function () {
    var isHovered = false;

    $('#notificationBell').hover(function () {
        isHovered = true;
        // Display notification information
        // Replace the code below with your implementation
        if (isHovered) {
            markNotificationsAsRead();

        }
    }, function () {
        isHovered = false;
    });
});

function markNotificationsAsRead() {
    $.ajax({
        type: "POST",
        url: "read",
        success: function (response) {

        },
        error: function (xhr, status, error) {
            // Handle the error if the AJAX request fails
        }
    });
}

$(document).ready(function () {
    // Xử lý sự kiện click nút "Reload"
    $("#reloadButton").click(function () {
        // Reload phần tử có ID "reloadDiv" bằng cách tải lại trang JSP
        $("#reloadDiv").load(location.href + " #reloadDiv");
    });
});