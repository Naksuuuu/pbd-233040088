 SELECT
E.empid,
E.firstname,
E.lastname
FROM
HR.Employees AS E
LEFT JOIN
Sales.Orders AS O
ON
E.empid = O.empid
AND
O.orderdate >= '2008-05-01'
WHERE
O.orderid IS NULL;