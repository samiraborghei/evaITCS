const accounts = [
    {
        accountId: 5001,
        accountType: "Checking",
        balance: 4250.75,
        status: "Active"
    },
    {
        accountId: 5002,
        accountType: "Savings",
        balance: 12500,
        status: "Active"
    }
];

const accountCards = accounts.map(account => {
    return `
        <div class="card">
            <h2>${account.accountType} Account</h2>
            <p>Account ID: ${account.accountId}</p>
            <p>Balance: $${account.balance}</p>
            <p>Status: ${account.status}</p>
        </div>
    `;
});

document.getElementById("accounts").innerHTML = accountCards.join("");