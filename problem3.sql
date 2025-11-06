CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    rating INT,
    age REAL
);

INSERT INTO Sailors VALUES
(1, 'Ben', 8, 25.5),
(2, 'Brian', 7, 28.0),
(3, 'John', 6, 22.3),
(4, 'Steve', 9, 31.2),
(5, 'Bob', 5, 26.7);


SELECT sname, UPPER(sname) AS Upper_Name FROM Sailors;

SELECT sname, LOWER(sname) AS Lower_Name FROM Sailors;

SELECT sname, LENGTH(sname) AS Name_Length FROM Sailors;
SELECT sname, SUBSTRING(sname, 1, 3) AS First_Three_Chars FROM Sailors;
SELECT CONCAT(sname, ' - Rating: ', rating) AS Sailor_Info FROM Sailors;
SELECT sname, REPLACE(sname, 'B', 'R') AS Replaced_Name FROM Sailors;
SELECT TRIM('   Hello   ') AS Trimmed,
       LTRIM('   Hello   ') AS Left_Trimmed,
       RTRIM('   Hello   ') AS Right_Trimmed;



BEGIN TRANSACTION;

INSERT INTO Sailors VALUES (6, 'Barry', 7, 24.5);

COMMIT;


BEGIN TRANSACTION;

INSERT INTO Sailors VALUES (7, 'Bruce', 9, 27.5);

ROLLBACK;


BEGIN TRANSACTION;

INSERT INTO Sailors VALUES (8, 'Blake', 8, 30.0);
SAVEPOINT sp1;

INSERT INTO Sailors VALUES (9, 'Bill', 6, 23.5);
SAVEPOINT sp2;

-- Rollback to savepoint sp1
ROLLBACK TO sp1;

COMMIT;
