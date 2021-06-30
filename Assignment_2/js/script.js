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
let navbar = document.getElementById("navbar");

// Get the offset position of the navbar
let sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
    } else {
        navbar.classList.remove("sticky");
    }
}

//FORM:
var count1 = 0;
var flag = 0;
function beginnerclick() {
    document.getElementById("dropdown1").innerHTML = "Beginner<span class=\"caret\"></span>";
    count1 = 1;
}
function intermediateclick() {
    document.getElementById("dropdown1").innerHTML = "Intermediate<span class=\"caret\"></span>";
    count1 = 2;
}
function proficientclick() {
    document.getElementById("dropdown1").innerHTML = "Proficient<span class=\"caret\"></span>";
    count1 = 3;
}

function submitbuttonclick() {
    if (document.getElementById("aName").value == "") {
        window.alert("Enter name");
        return;
    }
    if (document.getElementById("aSkill").value == "") {
        window.alert("Enter Skill");
        return;
    }
    if (count1 == 0) {
        window.alert("Select proficiency");
        return;
    }
    if (flag == 0) {
        var division = document.getElementById("container2");
        var newTable = document.createElement("table");
        newTable.className = "table table-striped table-bordered table-responsive";
        var tableHead = document.createElement("thead");
        var tableHeadRow = document.createElement("tr");
        var tableHeadRowElement1 = document.createElement("th");
        var tableHeadRowElement2 = document.createElement("th");
        var tableHeadRowElement3 = document.createElement("th");
        tableHeadRowElement1.innerHTML = "NAME";
        tableHeadRowElement2.innerHTML = "SKILL";
        tableHeadRowElement3.innerHTML = "LEVEL";
        tableHeadRow.appendChild(tableHeadRowElement1);
        tableHeadRow.appendChild(tableHeadRowElement2);
        tableHeadRow.appendChild(tableHeadRowElement3);
        tableHead.appendChild(tableHeadRow);
        newTable.appendChild(tableHead);
        division.appendChild(newTable);
        flag = 1;
        var tableBody = document.createElement("tbody");
        tableBody.id = "newTableBody";
        newTable.appendChild(tableBody);
        newTable.id = "newTable";
    }

    
    var tableBody = document.getElementById("newTableBody");
    var tableRow = document.createElement("tr");
    var tableData1 = document.createElement("td");
    var tableData2 = document.createElement("td");
    var tableData3 = document.createElement("td");
    var asd = document.getElementById("aName").value;
    var fgh = document.getElementById("aSkill").value;
    tableData1.innerHTML = asd;
    tableData2.innerHTML = fgh;
    if (count1 == 1)
        tableData3.innerHTML = "Beginner";
    else if (count1 == 2)
        tableData3.innerHTML = "Intermediate";
    else if (count1 == 3)
        tableData3.innerHTML = "Proficient";
    tableRow.appendChild(tableData1);
    tableRow.appendChild(tableData2);
    tableRow.appendChild(tableData3);
    tableBody.appendChild(tableRow);
    document.getElementById("dropdown1").innerHTML = "Proficiency<span class=\"caret\"></span>";
    document.getElementById("aName").value = "";
    document.getElementById("aSkill").value = "";
    count1 = 0;
}