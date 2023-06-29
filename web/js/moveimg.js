var currentIndex = 0;
var images = document.getElementsByClassName('carousel-img');

function showImage(index) {
    for (var i = 0; i < images.length; i++) {
        images[i].classList.remove('active');
    }
    images[index].classList.add('active');
}

function nextImage() {
    currentIndex++;
    if (currentIndex >= images.length) {
        currentIndex = 0;
    }
    showImage(currentIndex);
}

function previousImage() {
    currentIndex--;
    if (currentIndex < 0) {
        currentIndex = images.length - 1;
    }
    showImage(currentIndex);
}

setInterval(nextImage, 5000); // Change image every 5 seconds
showImage(currentIndex); // Show the first image initially
