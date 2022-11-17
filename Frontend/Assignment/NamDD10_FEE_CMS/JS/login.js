const email = document.getElementById("email");
const password = document.getElementById("pass");
const submit = document.getElementById("submit");
const myForm = document.getElementById("login");

function checkValid() {
    return (email.value.length >= 5 && email.value.length <= 50
        && password.value.length >= 8 && password.value.length <= 50) ? true : false;
}

submit.onclick = function () {
    if (checkValid()) {
        myForm.submit();
    } else {
        alert("Login failed!");
    }
}

