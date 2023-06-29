function calculateDuration(pastDateTimeString, cellId) {
    var pastDateTime = new Date(pastDateTimeString);
    var currentDateTime = new Date();

    var durationMillis = currentDateTime - pastDateTime;
    var durationSeconds = Math.floor(durationMillis / 1000);
    var durationMinutes = Math.floor(durationSeconds / 60);
    var durationHours = Math.floor(durationMinutes / 60);
    var durationDays = Math.floor(durationHours / 24);

    var durationCell = document.getElementById(cellId);
    if (durationDays != 0) {
        durationCell.textContent = durationDays + " days ago";
    }else if(durationHours != 0){
        durationCell.textContent = durationHours + " hours ago";
    }else if(durationMinutes != 0){
        durationCell.textContent = durationMinutes + " minutes ago";
    }else if(durationSeconds != 0){
        durationCell.textContent = durationSeconds + " seconds ago";
    }
//    durationCell.textContent = durationHours + " hours-" + durationMinutes + " minutes ago";
}

function calculateFuture(pastDateTimeString, cellId) {
    var pastDateTime = new Date(pastDateTimeString);
    var currentDateTime = new Date();

    var durationMillis = pastDateTime - currentDateTime;
    var durationSeconds = Math.floor(durationMillis / 1000);
    var durationMinutes = Math.floor(durationSeconds / 60);
    var durationHours = Math.floor(durationMinutes / 60);
    var durationDays = Math.floor(durationHours / 24);
    var durationMonths = Math.floor(durationDays / 30);

    var durationCell = document.getElementById(cellId);
    if(durationMillis < 0){
        durationCell.textContent = "Expired";
    }else if (durationMonths !=0){
        durationCell.textContent = durationMonths + " months left";
    }else if (durationDays != 0) {
        durationCell.textContent = durationDays + " days left";
    }else if(durationHours != 0){
        durationCell.textContent = durationHours + " hours left";
    }else if(durationMinutes != 0){
        durationCell.textContent = durationMinutes + " minutes left";
    }else if(durationSeconds != 0){
        durationCell.textContent = durationSeconds + " seconds left";
    }
//    durationCell.textContent = durationHours + " hours-" + durationMinutes + " minutes ago";
}