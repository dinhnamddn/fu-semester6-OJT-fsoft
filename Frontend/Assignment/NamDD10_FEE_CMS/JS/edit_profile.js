const firstname = document.getElementById("firstname");
const lastname = document.getElementById("lastname");
const phone = document.getElementById("phone");
const description = document.getElementById("description");
const submit = document.getElementById("submit");
const reset = document.getElementById("reset");

function checkValid() {
    return (firstname.value.length >= 3 && firstname.value.length <= 50
        && lastname.value.length >= 3 && lastname.value.length <= 30
        && phone.value.length >= 9 && phone.value.length <= 13
        && description.value.length >= 0 && description.value.length <= 200
    ) ? true : false;
}

submit.onclick = function () {
    if (checkValid()) {
        alert("Edit successful!");
        window.location = "edit_profile.html";
    } else {
        alert("Edit failed!");
        document.getElementById("editProfile").reset();
    }
}

reset.onclick = function () {
    document.getElementById("editProfile").reset();
}

