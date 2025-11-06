CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    rating INT,
    age REAL
);

CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(30),
    color VARCHAR(15)
);

CREATE TABLE Reserves (
    sid INT REFERENCES Sailors(sid),
    bid INT REFERENCES Boats(bid),
    day DATE
);


-- Insert data into Sailors
INSERT INTO Sailors VALUES
(1, 'Ben', 8, 25.5),
(2, 'Brian', 7, 28.0),
(3, 'John', 6, 22.3),
(4, 'Steve', 9, 31.2),
(5, 'Bob', 5, 26.7);

-- Insert data into Boats
INSERT INTO Boats VALUES
(101, 'Red Pearl', 'Red'),
(102, 'Blue Wave', 'Blue'),
(103, 'Green Leaf', 'Green'),
(104, 'Sea Rider', 'Red'),
(105, 'Ocean Mist', 'Green');

-- Insert data into Reserves
INSERT INTO Reserves VALUES
(1, 101, '2024-11-02'),
(2, 103, '2024-11-03'),
(3, 102, '2024-11-04'),
(1, 104, '2024-11-05'),
(2, 105, '2024-11-06'),
(5, 103, '2024-11-07');


SELECT s.sname
FROM Sailors s
WHERE EXISTS (
    SELECT 1
    FROM Reserves r
    WHERE r.sid = s.sid
      AND r.bid IN (
          SELECT b.bid
          FROM Boats b
          WHERE b.color = 'Red'
      )
);

CREATE VIEW Sailor_Boat_View AS
SELECT s.sname, b.bname, b.color, r.day
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid;


SELECT * FROM Sailor_Boat_View;


INSERT INTO Sailor_Boat_View VALUES ('Steve', 'Ocean Mist', 'Green', '2024-11-10');

UPDATE Sailor_Boat_View
SET color = 'Yellow'
WHERE sname = 'Ben';

DELETE FROM Sailor_Boat_View WHERE sname = 'Bob';

CREATE MATERIALIZED VIEW Sailor_Boat_MV
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT s.sname, b.bname, b.color, r.day
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid;

SELECT * FROM Sailor_Boat_MV;


REFRESH MATERIALIZED VIEW Sailor_Boat_MV;
