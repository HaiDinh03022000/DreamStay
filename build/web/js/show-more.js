const description = document.querySelector('.description');
const showMoreButton = document.querySelector('.show-more-button');

// Check if the description text overflows the container
if (description.scrollHeight > description.clientHeight) {
    showMoreButton.style.display = 'block'; // Display the show more button
}

showMoreButton.addEventListener('click', function () {
    if (description.classList.contains('expanded')) {
        description.classList.remove('expanded');
        description.style.maxHeight = '100px'; // Set the height limit again
        showMoreButton.innerText = 'Show more';
    } else {
        description.classList.add('expanded');
        description.style.maxHeight = 'none'; // Remove the height limit
        showMoreButton.innerText = 'Show less';
    }
});

var myLink = document.querySelector('a[href="#"]');
myLink.addEventListener('click', function (e) {
    e.preventDefault();
});