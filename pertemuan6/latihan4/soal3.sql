SELECT p.ProjectsName, d.DepartmentsName
FROM Projects p 
JOIN Departments d ON p.DepartmentsID = d.DepartmentsID