-- Create the database
CREATE DATABASE BankManagementSystem;


-- 1. Branch Table
CREATE TABLE Branch (
branch_id INT PRIMARY KEY IDENTITY(1,1),
branch_address VARCHAR(255) NOT NULL,
assets DECIMAL(18, 2)
);

-- 2. Banker Table
CREATE TABLE Banker (
banker_id INT PRIMARY KEY IDENTITY(1,1),
banker_name VARCHAR(100) NOT NULL,
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- 3. Account Table
CREATE TABLE Account (
account_id INT PRIMARY KEY IDENTITY(1,1),
account_balance DECIMAL(18, 2) DEFAULT 0,
account_type VARCHAR(50) CHECK (account_type IN ('Savings', 'Current' )),
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)

);

-- 4. Customer Table
CREATE TABLE Customer (
customer_id INT PRIMARY KEY IDENTITY(1,1),
customer_name VARCHAR(100) NOT NULL,
dob DATE,
mobile_no VARCHAR(15),
account_id INT,
FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- 5. CreditCard Table
CREATE TABLE CreditCard (
credit_card_id INT PRIMARY KEY IDENTITY(1,1),
expiry_date DATE NOT NULL,
card_limit DECIMAL(18, 2),
account_id INT,
FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- 6. Loan Table
CREATE TABLE Loan (
loan_id INT PRIMARY KEY IDENTITY(1,1),
issued_amount DECIMAL(18, 2),
remaining_amount DECIMAL(18, 2),
account_id INT,
branch_id INT,
FOREIGN KEY (account_id) REFERENCES Account(account_id),
FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- 7. LoanPayment Table
CREATE TABLE LoanPayment (
loan_payment_id INT PRIMARY KEY IDENTITY(1,1),
amount DECIMAL(18, 2),
payment_date DATE DEFAULT GETDATE(),
loan_id INT,
FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)

);

-- Branch Table
INSERT INTO Branch (branch_address, assets) VALUES
('Dhaka', 5000000),
('Chattogram', 4500000),
('Khulna', 4000000),
('Rajshahi', 3800000),
('Barishal', 3500000),
('Sylhet', 4200000),
('Mymensingh', 3900000),
('Rangpur', 3700000),
('Comilla', 3600000),
('Gazipur', 3400000);

-- Banker Table
INSERT INTO Banker (banker_name, branch_id) VALUES
('Md. Rafiqul Islam', 1),
('Farzana Akter', 2),
('Abdul Kalam', 3),
('Shahiduzzaman', 4),
('Nusrat Jahan', 5),
('Mohammad Ali', 6),
('Taslima Begum', 7),
('Kamrul Hasan', 8),
('Sabina Yasmin', 9),
('Imran Hossain', 10);
-- Account Table
INSERT INTO Account (account_balance, account_type, branch_id) VALUES
(100000, 'Savings', 1),
(250000, 'Current', 2),
(150000, 'Savings', 3),
(300000, 'Current', 4),
(800000, 'Savings', 5),
(400000, 'Current', 6),
(500000, 'Savings', 7),
(350000, 'Current', 8),
(180000, 'Savings', 9),
(450000, 'Current', 10);



-- Customer Table
INSERT INTO Customer (customer_name, dob, mobile_no, account_id) VALUES
('Md. Ashraful Alam', '1990-01-15', '01712345678', 1),
('Farhana Akter', '1985-05-20', '01812345678', 2),
('Abir Khan', '1995-03-10', '01912345678', 3),
('Tania Rahman', '1988-07-12', '01512345678', 4),
('Rashed Ahmed', '1992-09-05', '01612345678', 5),
('Nazia Sultana', '1980-11-25', '01312345678', 6),
('Sumon Das', '1998-02-03', '01987654321', 7),
('Jannatul Ferdous', '1983-04-18', '01787654321', 8),
('Ruhul Amin', '1991-06-10', '01887654321', 9),
('Shirin Akter', '1987-08-22', '01687654321', 10);

-- CreditCard Table
INSERT INTO CreditCard (expiry_date, card_limit, account_id) VALUES
('2027-12-31', 50000, 1),
('2026-06-30', 100000, 2),
('2028-03-15', 75000, 3),
('2027-09-01', 80000, 4),
('2026-12-25', 60000, 5),
('2028-01-10', 90000, 6),
('2027-05-20', 70000, 7),
('2026-08-15', 85000, 8),
('2027-11-05', 65000, 9),
('2026-04-30', 95000, 10);

-- Loan Table
INSERT INTO Loan (issued_amount, remaining_amount, account_id, branch_id) VALUES
(500000, 400000, 1, 1),
(300000, 300000, 2, 2),
(700000, 600000, 3, 3),
(450000, 400000, 4, 4),
(600000, 550000, 5, 5),
(800000, 700000, 6, 6),
(550000, 500000, 7, 7),
(750000, 650000, 8, 8),
(650000, 600000, 9, 9),
(900000, 800000, 10, 10);

-- LoanPayment
INSERT INTO LoanPayment (amount, loan_id) VALUES
(20000, 1),
(15000, 2),
(30000, 3),
(25000, 4),
(10000, 5),
(20000, 6),
(15000, 7),
(25000, 8),
(30000, 9),
(10000, 10);


