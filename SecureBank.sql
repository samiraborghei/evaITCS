USE SecureBank;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customer;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(30),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);


INSERT INTO customer
VALUES
(1, 'John', 'Smith', 'john@gmail.com'),
(2, 'Sarah', 'Jones', 'sarah@gmail.com'),
(3, 'Mike', 'Brown', 'mike@gmail.com');


INSERT INTO accounts
VALUES
(101, 1, 'Checking', 1200.00),
(102, 1, 'Savings', 3500.00),
(103, 2, 'Checking', 900.00);


INSERT INTO transactions
VALUES
(1, 101, 200.00, '2026-07-20'),
(2, 101, -50.00, '2026-07-21'),
(3, 102, 500.00, '2026-07-22'),
(4, 103, -100.00, '2026-07-22');


SHOW TABLES;

SELECT * FROM customer;
SELECT * FROM accounts;
SELECT * FROM transactions;


SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    accounts.account_type,
    accounts.balance
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id;


SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    accounts.account_id
FROM customer
LEFT JOIN accounts
ON customer.customer_id = accounts.customer_id
WHERE accounts.account_id IS NULL;


SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    accounts.account_type,
    transactions.amount,
    transactions.transaction_date
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id
INNER JOIN transactions
ON accounts.account_id = transactions.account_id;

SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    accounts.account_type,
    accounts.balance
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id;

SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id
FROM customer
LEFT JOIN accounts
ON customer.customer_id = accounts.customer_id;
SELECT
    customer.first_name,
    customer.last_name,
    accounts.account_id,
    transactions.amount,
    transactions.transaction_date
FROM customer
INNER JOIN accounts
ON customer.customer_id = accounts.customer_id
INNER JOIN transactions
ON accounts.account_id = transactions.account_id;
SELECT * FROM customer;
INSERT INTO customer (customer_id, first_name, last_name, email)
VALUES
(4, 'Emily', 'Davis', 'emily@gmail.com'),
(5, 'James', 'Wilson', 'james@gmail.com'),
(6, 'Olivia', 'Taylor', 'olivia@gmail.com');

INSERT INTO accounts (account_id, customer_id, account_type, balance)
VALUES
(104, 4, 'Checking', 1800.00),
(105, 4, 'Savings', 5200.00),
(106, 5, 'Checking', 950.00),
(107, 6, 'Savings', 4100.00),
(108, 6, 'Checking', 650.00);

INSERT INTO transactions (transaction_id, account_id, amount, transaction_date)
VALUES
(5, 104, 300.00, '2026-07-23'),
(6, 104, -120.00, '2026-07-23'),
(7, 105, 1000.00, '2026-07-22'),
(8, 106, -75.00, '2026-07-21'),
(9, 107, 450.00, '2026-07-20'),
(10, 108, -50.00, '2026-07-23');

SELECT * FROM accounts;
SELECT *
FROM accounts 
WHERE account_id = 106;
START TRANSACTION;
UPDATE accounts 
SET balance = balance + 500
WHERE account_id = 106;
SELECT *
FROM accounts
WHERE account_id = 106;
COMMIT;

UPDATE customer
SET deleted_at = NOW()
WHERE costumer_id = 3;

UPDATE accounts
SET deleted_at = NOW()
WHERE account_id = 106;

UPDATE transactions 
SET deleted_at = NOW()
WHERE transaction_id = 8;

UPDATE accounts
SET deleted_at = null
WHERE account_id = 106;

SELECT *
FROM customer
WHERE deleted_at IS NULL;

SELECT *
FROM accounts
WHERE deleted_at IS NULL;

SELECT *
FROM transactions
WHERE deleted_at IS NULL;

DESCRIBE customer;



