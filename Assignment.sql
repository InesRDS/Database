CREATE DATABASE Swimming;
 
USE Swimming;

CREATE TABLE Course (courseID int primary key, grade varchar(30), sessions varchar(30), instructorName varchar(30),
startDate date, lessonTime time);
-- level is a function so I changed it to 'grade'

CREATE TABLE Members (memberID int primary key, firstName varchar(30), lastName varchar (30), DOB date,
address varchar (50), city varchar (20)); 
drop table Members;

CREATE TABLE Lessons (lessonID int primary key, courseID int REFERENCES Course(courseID), memberID int REFERENCES Members(memberID ));
-- I'm struggling with foreign keys
drop table Lessons;

INSERT INTO Course (courseID, grade, sessions, instructorName, startDate, lessonTime) VALUES 
(38, 'Grade 3', '7 sessions', 'Gary', '2021-04-27', '19:00:00'), (89, 'Grade 3', '8 sessions', 'Gary', '2021-04-01','06:30:00'), 
(4, 'Grade 10', '48 sessions', 'Lisa', '2017-08-14', '06:00:00'), (65, 'Grade 1', '2 sessions', 'Marie', '2022-11-25', '15:00:00'), 
(5, 'Grade 8', '39 sessions', 'Lisa', '2018-07-21', '13:00:00');
DROP TABLE Course; -- it wasn't recognising lessonTime so I had to drop the table and do it again

INSERT INTO Members (memberID, firstName, lastName, DOB, address, city) VALUES 
(321, 'Emma', 'Smith', '1978-03-21', '29 Mulberry Lane', 'Manchester'), (491, 'Jack', 'White', '1982-02-02', '33 Crisscross Road', 'Manchester'),
(214, 'Leah', 'Dolan', '1996-05-12', '159 Finnsbury Park', 'Mancester'), (568, 'Nora', 'Ahmed', '1965-10-09', '22 Uppernorth Street', 'Manchester'),
(437, 'Tony', 'Soprano', '1979-06-24', '52 Lloyd Street', 'Manchester');

-- Q1: Where courseID is equals to a number below 5 and the first name of any of the instructors
SELECT * FROM Course WHERE courseID<5; 
SELECT * FROM Course WHERE courseID<5 AND instructorName=instructorName;
-- struggled with the second part at first but the above line ran

-- Q2: Where courseID is equals to a number above 5 and the lesson time is in the morning or afternoon.  
SELECT * FROM Course WHERE courseID>5 AND lessonTime<'17:00:00';

-- Q3: Order by the above results by startDate in “course” table 
SELECT * FROM Course ORDER BY startDate;

-- Q4: Order by the above results by MemberID in “members” table
SELECT * FROM Members ORDER BY memberID;

-- Q5: UPDATE the Members table, change the addresses of any three members
UPDATE Members SET address='29 Zoo Lane' WHERE memberID=321;
UPDATE Members SET address='64 Archbury Road' WHERE memberID=491; 
UPDATE Members SET address='125 Hollyedge Street' WHERE memberID=214;

-- Q6: UPDATE the Course table, change the startDate and lesson time for three of the sessions
UPDATE Course SET startDate='2017-05-18', lessonTime='08:30:00' WHERE courseID=4;
UPDATE Course SET startDate='2015-06-09', lessonTime='09:00:00' WHERE courseID=65;
UPDATE Course SET startDate='2022-12-12', lessonTime='08:00:00' WHERE courseID=5;

-- Q7 Use the SQL MIN () and MAX () functions to return the smallest and largest value: 
-- Of the LessonID column in the “lesson” table 
SELECT MIN(lessonID) AND MAX(lessonID) FROM Lessons;
-- Of the membersID column in the “members” table  
SELECT MIN(memberID) FROM Members;
SELECT MAX(memberID) FROM Members;

-- Q8 Use the SQL COUNT (), AVG () and SUM () functions for these:
-- Count the total number of members in the “members” table 
SELECT COUNT(memberid) FROM Members;
-- Count the total number of sessions in the “course” table 
SELECT SUM(sessions) FROM Course;
-- Find the average session time for all sessions in the “course” table 
SELECT AVG(lessonTime) FROM course;

-- Q9 WILDCARD queries (like operator)  
-- Find all the people from the “members” table whose last name starts with A. 
SELECT * FROM Members WHERE lastName LIKE 'a%';

-- Find all the people from the “members” table whose last name ends with A. 
SELECT * FROM Members WHERE lastName LIKE '%a';

-- Find all the people from the “members” table that have "ab" in any position in the last name. 
SELECT * FROM Members WHERE lastName LIKE '%ab%';

-- Find all the people from the “members” table that that have "b" in the second position in their first name. 
SELECT * FROM Members WHERE firstName LIKE '_b%';

-- Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length: 
SELECT * FROM Members WHERE lastName LIKE 'a___%';

-- Find all the people from the “members” table whose last name starts with "a" and ends with "y" 
SELECT * FROM Members WHERE lastName LIKE 'a%y';

-- Find all the people from the “members” table whose last name does not starts with "a" and ends with "y" 
SELECT * FROM Members WHERE NOT lastName LIKE 'a%y';

-- Q10 What do you understand by LEFT and RIGHT join? Explain with an example
-- My understanding is that when you use LJOIN everything from the LEFT table will be added 
-- and from the right table only the data that matches will be added. And vice-versa for RJOIN
-- An example: I will update one of the members name to match the instructors name and join their tables
UPDATE Members SET firstName='Gary' WHERE memberID=491;

SELECT Members.firstName, course.instructorName FROM members LEFT JOIN course ON
members.firstName=course.instructorName;
-- It's given me 2 Gary's on each side, not sure why

