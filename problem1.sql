-- Create Sailors table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30) NOT NULL,
    rating INT,
    age REAL
);

-- Create Boats table
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(30) NOT NULL,
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
-- Insert data into Sailors
INSERT INTO Sailors VALUES
(1, 'Rahul', 8, 25.5),
(2, 'Arjun', 7, 30.0),
(3, 'Kiran', 9, 35.2),
(4, 'Vijay', 8, 28.0),
(5, 'Suresh', 7, 40.5);

-- Insert data into Boats
INSERT INTO Boats VALUES
(101, 'Titan', 'Red'),
(102, 'Dolphin', 'Blue'),
(103, 'WaveRider', 'Green'),
(104, 'SeaQueen', 'Red'),
(105, 'AquaStar', 'Yellow');

-- Insert data into Reserves
INSERT INTO Reserves VALUES
(1, 101, '2024-06-01'),
(2, 104, '2024-06-03'),
(3, 102, '2024-06-05'),
(1, 105, '2024-06-10'),
(4, 103, '2024-06-15');

SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid;


SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT r.sid
    FROM Reserves r
    WHERE r.bid IN (
        SELECT b.bid
        FROM Boats b
        WHERE b.color = 'Red'
    )
);

SELECT s.sname, b.bname, b.color
FROM Sailors s
LEFT JOIN Reserves r ON s.sid = r.sid
LEFT JOIN Boats b ON r.bid = b.bid;


SELECT s1.rating, s1.sname, s1.age
FROM Sailors s1
WHERE s1.age = (
    SELECT MAX(s2.age)
    FROM Sailors s2
    WHERE s2.rating = s1.rating
);
