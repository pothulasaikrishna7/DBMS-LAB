CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Salesperson VARCHAR(30),
    Region VARCHAR(20),
    Amount DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(1, 'Akira', 'North', 5000),
(2, 'Rahul', 'South', 7000),
(3, 'Akira', 'North', 3000),
(4, 'Ravi', 'East', 4000),
(5, 'Sneha', 'South', 9000),
(6, 'Ravi', 'East', 2000);


SELECT Salesperson, SUM(Amount) AS Total_Sales
FROM Sales
GROUP BY Salesperson;

SELECT Region, COUNT(SaleID) AS Total_Transactions
FROM Sales
GROUP BY Region;

SELECT Salesperson, SUM(Amount) AS Total_Sales
FROM Sales
GROUP BY Salesperson
HAVING SUM(Amount) > 7000;

SELECT Region, SUM(Amount) AS Region_Sales
FROM Sales
GROUP BY Region
HAVING SUM(Amount) > 10000;





CREATE TABLE Accounts (
    AccNo INT PRIMARY KEY,
    HolderName VARCHAR(30),
    Balance DECIMAL(10,2)
);

INSERT INTO Accounts VALUES
(1, 'Akira', 10000),
(2, 'Rahul', 8000),
(3, 'Sneha', 12000);

START TRANSACTION;
SAVEPOINT sp1;


UPDATE Accounts SET Balance = Balance - 2000 WHERE HolderName = 'Akira';
UPDATE Accounts SET Balance = Balance + 2000 WHERE HolderName = 'Rahul';


SAVEPOINT sp2;
ROLLBACK TO sp1;


UPDATE Accounts SET Balance = Balance + 1000 WHERE HolderName = 'Sneha';
COMMIT;

SELECT * FROM Accounts;
