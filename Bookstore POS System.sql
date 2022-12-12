--a. Show schema generation query
select s.name as schema_name, 
    s.schema_id,
    u.name as schema_owner
from sys.schemas s
    inner join sys.sysusers u
        on u.uid = s.principal_id
order by s.name

--b. Show the SQL query for number of customers purchasing more than 5 books

SELECT b.name, sum(a.[quantity]) AS total_qty
FROM invoice_lines a,customers b, invoices c 
WHERE a.invoice_id=c.id AND b.id=c.customer_id GROUP BY name
HAVING sum(a.[quantity]) > 5

--c. Show the SQL query for a list of customers who never purchased anything

SELECT a.name, a.id from customers a 
LEFT JOIN invoices b  on a.id=b.customer_id WHERE b.id IS NULL

--d. Show the SQL query for list of book purchased with the users

SELECT b.name, a.quantity, a.[description]
FROM invoice_lines a,customers b, invoices c 
WHERE a.invoice_id=c.id AND b.id=c.customer_id GROUP BY name