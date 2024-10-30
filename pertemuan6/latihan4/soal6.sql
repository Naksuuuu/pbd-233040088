SELECT 
    emp.Name AS KaryawanName,
    mgr.Name AS ManajerName
FROM 
    Employee emp
LEFT JOIN 
    Employee mgr ON emp.ManagerID = mgr.EmployeeID
ORDER BY 
    emp.Name;