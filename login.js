const form = document.getElementById("loginForm");
const message = document.getElementById("message");

form.addEventListener("submit", function (event) {
    event.preventDefault();

    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value;

    if (username === "customer" && password === "123456") {

        message.textContent = "✅ Login Successful!";
        message.style.color = "green";

        setTimeout(function () {
            window.location.href = "customer.html";
        }, 1500);

    } else if (username === "teller" && password === "123456") {

        message.textContent = "✅ Login Successful!";
        message.style.color = "green";

        setTimeout(function () {
            window.location.href = "teller.html";
        }, 1500);

    } else if (username === "admin" && password === "123456") {

        message.textContent = "✅ Login Successful!";
        message.style.color = "green";

        setTimeout(function () {
            window.location.href = "admin.html";
        }, 1500);

    } else {

        message.textContent = "❌ Invalid username or password!";
        message.style.color = "red";

    }
});

// Show/Hide Password
const togglePassword = document.getElementById("togglePassword");
const passwordField = document.getElementById("password");

togglePassword.addEventListener("click", function () {

    if (passwordField.type === "password") {
        passwordField.type = "text";
        togglePassword.textContent = "🙈";
    } else {
        passwordField.type = "password";
        togglePassword.textContent = "👁";
    }

});