//IMAGE CHANGES ON CLICKING:
count = 0;
function changeimage() {
    var imgelement = document.getElementById("changeimage")
    if (count % 5 == 0) {
        imgelement.src = "../img/Img2.jpeg";
        imgelement.alt = "Second image";
    }
    else if (count % 5 == 1) {
        imgelement.src = "../img/Img3.jpeg";
        imgelement.alt = "Third image";
    }
    else if (count % 5 == 2) {
        imgelement.src = "../img/Img4.jpeg";
        imgelement.alt = "Fourth image";
    }
    else if (count % 5 == 3) {
        imgelement.src = "../img/Img5.jpeg";
        imgelement.alt = "Fifth image";
    }
    else if (count % 5 == 4) {
        imgelement.src = "../img/Img1.jpeg";
        imgelement.alt = "First image";
    }
    count++;
}