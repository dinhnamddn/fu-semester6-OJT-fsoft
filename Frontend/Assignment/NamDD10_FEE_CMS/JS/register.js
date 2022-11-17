const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("pass");
const rePassword = document.getElementById("repass");

const submit = document.getElementById("submit");
const myForm = document.getElementById("register");

function checkValid() {
    return (username.value.length >= 3 && username.value.length <= 30
        && email.value.length >= 5
        && password.value.length >= 8 && password.value.length <= 30
        && password.value === rePassword.value
    ) ? true : false;
}

submit.onclick = function () {
    if (checkValid()) {
        alert("Register successful!");
        myForm.submit();
    } else {
        alert("Register failed!");
    }
}

