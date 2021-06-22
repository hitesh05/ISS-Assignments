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