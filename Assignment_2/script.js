//CHANGE COLOR ON HOVER:
document.getElementById("Home").addEventListener("mouseover", function () {
    document.getElementById("Home").style.color = "yellow";
});

document.getElementById("Home").addEventListener("mouseout", function () {
    document.getElementById("Home").style.color = "white";
});

document.getElementById("About").addEventListener("mouseover", function () {
    document.getElementById("About").style.color = "yellow";
});

document.getElementById("About").addEventListener("mouseout", function () {
    document.getElementById("About").style.color = "white";
});

document.getElementById("Exercises").addEventListener("mouseover", function () {
    document.getElementById("Exercises").style.color = "yellow";
});

document.getElementById("Exercises").addEventListener("mouseout", function () {
    document.getElementById("Exercises").style.color = "white";
});

document.getElementById("Contact").addEventListener("mouseover", function () {
    document.getElementById("Contact").style.color = "yellow";
});

document.getElementById("Contact").addEventListener("mouseout", function () {
    document.getElementById("Contact").style.color = "white";
});

//STICKY NAVBAR:
// When the user scrolls the page, execute myFunction
window.onscroll = function () { myFunction() };

// Get the navbar
var navbar = document.getElementById("navbar");

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
    } else {
        navbar.classList.remove("sticky");
    }
}

//IMAGE CHANGES ON CLICKING:
count = 0;
function changeimage() {
    var imgelement = document.getElementById("changeimage")
    if (count % 5 == 0) {
        imgelement.src = "images/Img2.jpeg";
        imgelement.alt = "Second image";
    }
    else if (count % 5 == 1) {
        imgelement.src = "images/Img3.jpeg";
        imgelement.alt = "Third image";
    }
    else if (count % 5 == 2) {
        imgelement.src = "images/Img4.jpeg";
        imgelement.alt = "Fourth image";
    }
    else if (count % 5 == 3) {
        imgelement.src = "images/Img5.jpeg";
        imgelement.alt = "Fifth image";
    }
    else if (count % 5 == 4) {
        imgelement.src = "images/Img1.jpeg";
        imgelement.alt = "First image";
    }
    count++;
}