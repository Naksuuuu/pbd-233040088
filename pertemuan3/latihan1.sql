SELECT
empid,
firstname,
lastname,
titleofcourtesy,
CASE
WHEN titleofcourtesy = 'Ms.' THEN 'Female'
WHEN titleofcourtesy = 'Mrs.' THEN 'Female'
WHEN titleofcourtesy = 'Mr.' THEN 'Male'
ELSE 'Unknown'
END AS gender
FROM
HR.Employees;