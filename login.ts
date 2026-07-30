const form = document.getElementById("loginForm") as HTMLFormElement | null;
const message = document.getElementById("message") as HTMLElement | null;
const togglePassword = document.getElementById("togglePassword") as HTMLButtonElement | null;
const passwordField = document.getElementById("password") as HTMLInputElement | null;
const usernameField = document.getElementById("username") as HTMLInputElement | null;

const destinations: Record<string, string> = {
    customer: "customer.html",
    teller: "teller.html",
    admin: "admin.html",
};

if (form && message && togglePassword && passwordField && usernameField) {
    form.addEventListener("submit", (event: Event) => {
        event.preventDefault();

        const username = usernameField.value.trim();
        const password = passwordField.value;
        const destination = destinations[username];

        if (destination && password === "123456") {
            message.textContent = "✅ Login Successful!";
            message.style.color = "green";

            setTimeout(() => {
                window.location.href = destination;
            }, 1500);
        } else {
            message.textContent = "❌ Invalid username or password!";
            message.style.color = "red";
        }
    });

    togglePassword.addEventListener("click", () => {
        if (passwordField.type === "password") {
            passwordField.type = "text";
            togglePassword.textContent = "🙈";
        } else {
            passwordField.type = "password";
            togglePassword.textContent = "👁";
        }
    });
}