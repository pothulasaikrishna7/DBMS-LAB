-- Create Sailors table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    rating INT,
    age REAL
);

-- Create Boats table
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(30),
    color VARCHAR(15)
);

-- Create Reserves table
CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

-- Insert values into Sailors
INSERT INTO Sailors VALUES
(1, 'Ben', 8, 25.5),
(2, 'Brian', 7, 28.0),
(3, 'John', 6, 22.3),
(4, 'Steve', 9, 31.2),
(5, 'Bob', 5, 26.7);

-- Insert values into Boats
INSERT INTO Boats VALUES
(101, 'Red Pearl', 'Red'),
(102, 'Blue Wave', 'Blue'),
(103, 'Green Leaf', 'Green'),
(104, 'Sea Rider', 'Red'),
(105, 'Ocean Mist', 'Green');

-- Insert values into Reserves
INSERT INTO Reserves VALUES
(1, 101, '2024-11-02'),
(2, 103, '2024-11-03'),
(3, 102, '2024-11-04'),
(1, 104, '2024-11-05'),
(2, 105, '2024-11-06'),
(5, 103, '2024-11-07');

SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'Red';

SELECT s.sname, b.bname, b.color
FROM Sailors s
LEFT JOIN Reserves r ON s.sid = r.sid
LEFT JOIN Boats b ON r.bid = b.bid;


SELECT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('Red', 'Green')
GROUP BY s.sname
HAVING COUNT(DISTINCT b.color) = 2;

SELECT sname
FROM Sailors
WHERE sname LIKE 'B%';
