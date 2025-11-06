CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    rating INT
);

CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid)
);


INSERT INTO Sailors VALUES
(1, 'Ben', 8),
(2, 'Brian', 7),
(3, 'John', 6);

INSERT INTO Reserves VALUES
(1, 101, '2024-11-01'),
(2, 102, '2024-11-02'),
(1, 103, '2024-11-03');

SELECT * 
FROM Sailors
NATURAL JOIN Reserves;

SELECT * 
FROM Sailors
CROSS JOIN Reserves;





CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Students VALUES
(1, 'Akira', 'Computer Science'),
(2, 'Rahul', 'Mathematics'),
(3, 'Ravi', 'Physics'),
(4, 'Sneha', 'Computer Science');

INSERT INTO Courses VALUES
(101, 'Database Systems', 3),
(102, 'Operating Systems', 4),
(103, 'Data Structures', 3);

INSERT INTO Enrollments VALUES
(1, 101, '2024-01-15'),
(1, 102, '2024-03-10'),
(2, 101, '2024-02-20'),
(3, 103, '2023-12-25'),
(4, 102, '2024-04-01');

SELECT StudentName, Major
FROM Students;

SELECT CourseName, Credits
FROM Courses;


SELECT c.CourseName, COUNT(e.StudentID) AS Total_Students
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;


SELECT s.StudentName, e.EnrollmentDate, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.EnrollmentDate > '2024-01-01';
