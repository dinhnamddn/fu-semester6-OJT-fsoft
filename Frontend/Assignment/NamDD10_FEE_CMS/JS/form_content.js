const title = document.getElementById("title");
const brief = document.getElementById("brief");
const content = document.getElementById("content");
const submit = document.getElementById("submit");
const reset = document.getElementById("reset");

function checkValid() {
    return (title.value.length >= 10 && title.value.length <= 200
        && brief.value.length >= 30 && brief.value.length <= 150
        && content.value.length >= 50 && content.value.length <= 1000
    ) ? true : false;
}

submit.onclick = function () {
    if (checkValid()) {
        alert("Add successful!");
        window.location = "view_contents.html";
    } else {
        alert("Add failed!");
        document.getElementById("addForm").reset();
    }
}

reset.onclick = function () {
    document.getElementById("addForm").reset();
}

