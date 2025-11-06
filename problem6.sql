CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Course_Instructors (
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);


INSERT INTO Instructors VALUES
(1, 'Akira', '9876543210'),
(2, 'Rahul', '9123456780'),
(3, 'Sneha', '9001234567');

INSERT INTO Courses VALUES
(101, 'Database Systems', 3),
(102, 'Operating Systems', 4),
(103, 'Introduction to Programming', 5),
(104, 'Computer Networks', 3);

INSERT INTO Course_Instructors VALUES
(101, 1),
(102, 2),
(103, 1),
(103, 3),
(104, 2);


SELECT i.InstructorName, COUNT(ci.CourseID) AS Number_of_Courses
FROM Instructors i
JOIN Course_Instructors ci ON i.InstructorID = ci.InstructorID
GROUP BY i.InstructorName;


SELECT CourseName, Credits
FROM Courses
WHERE Credits > 3;


SELECT c.CourseName, i.InstructorName
FROM Courses c
JOIN Course_Instructors ci ON c.CourseID = ci.CourseID
JOIN Instructors i ON ci.InstructorID = i.InstructorID;


SELECT i.InstructorName
FROM Instructors i
JOIN Course_Instructors ci ON i.InstructorID = ci.InstructorID
JOIN Courses c ON ci.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to Programming';

-- Create a user
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'password123';

-- Grant permission to SELECT and INSERT data in Courses table
GRANT SELECT, INSERT ON your_database.Courses TO 'student_user'@'localhost';


SHOW GRANTS FOR 'student_user'@'localhost';


GRANT SELECT, INSERT ON your_database.Courses TO 'student_user'@'localhost';


REVOKE INSERT ON your_database.Courses FROM 'student_user'@'localhost';

SHOW GRANTS FOR 'student_user'@'localhost';
