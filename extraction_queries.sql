/*
Write a query which will give us the course id number, course description, the number of units,
the offering term(whether it's online or in person), and the capacity. Include only those
courses which are more than 3 units and have a capacity of less than 40 students. We only want
to list courses which have actually been offered at least once. Sort it ascending by idCourse.
*/

SELECT [idCourse], [CourseDesc], [CourseUnits], [OffTerm], [Format], [Capacity]
FROM [dbo].[Course] as A
JOIN [dbo].[Offering] as B
ON A.idCourse = B.Course_idCourse
WHERE [CourseUnits] > 3 AND [Capacity] < 40 AND [Format] IN ('Online', 'In person')
GROUP BY [idCourse], [CourseDesc], [CourseUnits], [OffTerm], [Format], [Capacity]
HAVING COUNT(idOffering) >=1
ORDER BY [idCourse] ASC





/*Professor Victoria Emmerline is set to retire immediately before spring semester.
You want to generate a list of all students who are currently enrolled in any class
she is teaching this spring, so you can reach out to them and let them know there will
be a different professor. Assume each class she teaches could be assigned to a different
professor - i.e. if Professor Emmerline was set to teach Calculus I and Calculus II,
it's possible Calculus I will be assigned to Professor X and Calculus II will be
assigned to Professor Y.
*/

SELECT idFaculty, FacFirstName, FacLastName, idStudent, stdFirstName, stdLastName, stdMajor, OffTerm
FROM [dbo].[Student] AS A
JOIN [dbo].[Enrollment] AS B
ON A.idStudent = B.Student_idStudent
JOIN [dbo].[Offering] AS C
ON B.Offering_idOffering = C.idOffering
JOIN [dbo].[Course] AS D
ON C.Course_idCourse = D.idCourse
LEFT JOIN [dbo].[Faculty] AS E
ON E.idFaculty = C.Faculty_idFaculty
WHERE idFaculty=1 AND FacFirstName='Victoria' AND FacLastName='Emmerline' AND OffTerm='Spring'

