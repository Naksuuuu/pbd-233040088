SELECT
C.custid,
C.companyname,
O.orderid,
O.orderdate
FROM
Sales.Customers AS C
JOIN
Sales.Orders AS O
ON
C.custid = O.custid
ORDER BY
c.custid;