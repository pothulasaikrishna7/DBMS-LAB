CREATE TABLE Sales (
    id INT PRIMARY KEY,
    salesperson VARCHAR(30),
    region VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(1, 'Akira', 'North', 5000),
(2, 'Ravi', 'South', 4000),
(3, 'Akira', 'North', 3000),
(4, 'Rahul', 'East', 7000),
(5, 'Ravi', 'South', 6000);

SELECT COUNT(*) AS Total_Sales FROM Sales;
SELECT SUM(amount) AS Total_Amount FROM Sales;
SELECT AVG(amount) AS Average_Amount FROM Sales;
SELECT MAX(amount) AS Highest_Sale FROM Sales;
SELECT MIN(amount) AS Lowest_Sale FROM Sales;
SELECT region, SUM(amount) AS Total_Sales
FROM Sales
GROUP BY region;






CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'password123';
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    marks INT
);
GRANT SELECT, INSERT ON your_database.Students TO 'student_user'@'localhost';
SHOW GRANTS FOR 'student_user'@'localhost';
GRANT SELECT, INSERT ON your_database.Students TO 'student_user'@'localhost';
REVOKE INSERT ON your_database.Students FROM 'student_user'@'localhost';
SHOW GRANTS FOR 'student_user'@'localhost';
GRANT SELECT ON your_database.Students TO 'student_user'@'localhost';
