let body = document.querySelector('body');
document.querySelector('#red').onclick = function () {
    body.style.backgroundColor = 'red';
}
document.querySelector('#green').onclick = function () {
    body.style.backgroundColor = 'green';
}
document.querySelector('#blue').onclick = function () {
    body.style.backgroundColor = 'blue';
}

document.querySelector('#Covishield').onclick = function () {
    document.getElementById('vaccine').src = "images/covishield.jpg";
}
document.querySelector('#Covaxin').onclick = function () {
    document.getElementById('vaccine').src = "images/Covaxin.jpeg";
}
document.querySelector('#Sputnik').onclick = function () {
    document.getElementById('vaccine').src = "images/sputnik.jpeg";
}