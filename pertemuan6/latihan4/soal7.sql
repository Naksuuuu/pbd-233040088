
SELECT Name,
    (SELECT DepartmentsName 
     FROM Departments 
     WHERE Departments.DepartmentsID = Employee.DepartmentsID) AS DepartmentsName
FROM Employee;
