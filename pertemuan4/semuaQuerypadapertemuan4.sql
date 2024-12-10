SELECT TOP 3 lastname FROM HR.Employees


SELECT lastname, COUNT(*) AS TotalsameName
FROM HR.Employees
GROUP BY lastname 


SELECT e.firstname,e.hiredate 
FROM HR.Employees e
WHERE e.hiredate 
BETWEEN '2002-08-14' AND '2003-10-10'

SELECT lastname
FROM HR.Employees
WHERE lastname LIKE 'D%'

SELECT TOP 10 shipperid,freight FROM Sales.Orders
WHERE freight > 100
ORDER BY freight ASC


SELECT shippeddate
FROM Sales.Orders
WHERE shippeddate BETWEEN '2006-07-01' AND '2006-07-30'

SELECT orderid, shipperid, freight
FROM Sales.Orders
WHERE shipperid IN (1, 2)
ORDER BY shipperid ASC

SELECT SUM(freight) AS TotalFreight , shipperid
FROM Sales.Orders
GROUP BY shipperid