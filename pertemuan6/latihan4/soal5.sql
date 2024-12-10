SELECT 
    Employee.Name,
    Projects.ProjectsName
FROM 
    Employee
CROSS JOIN 
    Projects
ORDER BY 
    Employee.Name, Projects.ProjectsName;