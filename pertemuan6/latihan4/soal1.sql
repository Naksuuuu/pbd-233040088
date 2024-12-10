SELECT 
    Employee.Name,
    Departments.DepartmentsName
FROM 
    Employee
JOIN 
    Departments ON Employee.DepartmentsID = Departments.DepartmentsID;
