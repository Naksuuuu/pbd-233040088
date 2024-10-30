SELECT 
    Employee.Name,
    Projects.ProjectsName
FROM 
    Employee
LEFT JOIN 
    Projects ON Employee.DepartmentsID = Projects.DepartmentsID
ORDER BY 
    Employee.Name;