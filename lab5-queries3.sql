-- ANASTASIA LAPERUTA, 3/4/2025, LAB5-QUERIES3


-- 1. my answer
SELECT *  
FROM People  
INNER JOIN Customers ON People.pid = Customers.pid;


-- Difference: uses aliases and regular join; AI answer 9/10
SELECT p.*
FROM People p
JOIN Customers c ON p.pid = c.pid;







-- 2. my answer
SELECT *  
FROM People  
INNER JOIN Agents ON People.pid = Agents.pid;
 


-- Difference: uses aliases and regular join; AI answer 9/10
SELECT p.*
FROM People p
JOIN Agents a ON p.pid = a.pid;





-- 3. my answer
SELECT p.*, a.*
FROM People p
JOIN Customers c ON p.pid = c.pid
JOIN Agents a ON p.pid = a.pid;
 

-- Difference: doesn't show agents columns; AI answer 5/10
SELECT p.*
FROM People p
JOIN Customers c ON p.pid = c.pid
JOIN Agents a ON p.pid = a.pid;






-- 4. my answer
SELECT firstName 
FROM People p  
WHERE pid IN (SELECT pid
		FROM Customers 
		WHERE pid NOT IN(
    SELECT custId 
    FROM Orders)
);


-- Difference: Uses join & aliases; AI answer 5/10
SELECT p.firstName
FROM People p
JOIN Customers c ON p.pid = c.pid
WHERE c.pid NOT IN (SELECT custId FROM Orders);







-- 5. my answer
SELECT p.firstName 
FROM People p  
INNER JOIN Customers c ON p.pid = c.pid 
LEFT OUTER JOIN Orders o ON c.pid = o.custId 
WHERE o.custId IS NULL;



-- Difference: doesnt specify that its an inner join; AI answer 9/10
SELECT p.firstName
FROM People p
JOIN Customers c ON p.pid = c.pid
LEFT OUTER JOIN Orders o ON c.pid = o.custId
WHERE o.custId IS NULL;







-- 6. my answer
SELECT DISTINCT a.pid, a.commissionPct 
FROM Agents a
JOIN Orders o ON a.pid = o.agentId 
WHERE o.custId = 007
ORDER BY commissionPCT DESC;




-- Difference: didn't use DISTINCT, specified a for ORDER BY; AI answer 9/10
SELECT a.pid, a.commissionPct
FROM Agents a
JOIN Orders o ON a.pid = o.agentId
WHERE o.custId = 007
ORDER BY a.commissionPct DESC;





-- 7. my answer
SELECT DISTINCT People.lastName, People.homeCity, a.commissionPct
FROM People
JOIN Agents a ON People.pid = a.pid 
JOIN Orders o ON a.pid = o.agentId
WHERE o.custId = 001
ORDER BY a.commissionPct DESC;


-- Difference: used aliases for all & didn't use DISTINCT; AI answer 9/10
SELECT p.lastName, p.homeCity, a.commissionPct
FROM People p
JOIN Agents a ON p.pid = a.pid
JOIN Orders o ON a.pid = o.agentId
WHERE o.custId = 001
ORDER BY a.commissionPct DESC;





-- 8. my answer
SELECT lastName, homeCity
FROM People p
JOIN Agents a ON p.pid = a.pid
WHERE p.homeCity IN (
    SELECT city
    FROM Products
    GROUP BY city
    HAVING COUNT(DISTINCT prodId) = (
        SELECT MIN(product_count)
        FROM (
            SELECT COUNT(DISTINCT prodId) AS product_count, city
            FROM Products
            GROUP BY city
        ) AS product_counts
    )
);



-- Difference: uses alias throughout & uses 'subquery'; AI answer 10/10
SELECT p.lastName, p.homeCity
FROM People p
JOIN Agents a ON p.pid = a.pid
WHERE p.homeCity IN (
    SELECT city
    FROM Products
    GROUP BY city
    HAVING COUNT(DISTINCT prodId) = (
        SELECT MIN(product_count)
        FROM (
            SELECT COUNT(DISTINCT prodId) AS product_count
            FROM Products
            GROUP BY city
        ) subquery
    )
);






-- 9. my answer
SELECT DISTINCT Products.name, Products.prodId
FROM Products
JOIN Orders o ON Products.prodId = o.prodId
JOIN Agents a ON o.agentId = a.pid
JOIN Customers c ON o.custId = c.pid
JOIN People p ON c.pid = p.pid
WHERE p.homeCity = 'Oyster Bay'
ORDER BY Products.name ASC;




-- Difference: uses both methods (subqueries and joins) & uses aliases more & both methods give different answers; AI answer 5/10
SELECT DISTINCT pr.name, pr.prodId
FROM Products pr
JOIN Orders o ON pr.prodId = o.prodId
JOIN Agents a ON o.agentId = a.pid
JOIN Customers c ON o.custId = c.pid
JOIN People p ON c.pid = p.pid
WHERE p.homeCity = 'Oyster Bay'
ORDER BY pr.name ASC;

SELECT DISTINCT name, prodId
FROM Products
WHERE prodId IN (
    SELECT o.prodId
    FROM Orders o
    WHERE o.agentId IN (
        SELECT a.pid
        FROM Agents a
        WHERE a.pid IN (
            SELECT o.agentId
            FROM Orders o
            JOIN Customers c ON o.custId = c.pid
            JOIN People p ON c.pid = p.pid
            WHERE p.homeCity = 'Oyster Bay'
        )
    )
)
ORDER BY name ASC;







-- 10. my answer
SELECT p.firstName AS PFirst, p.lastName AS PLast, 
       pe.firstName AS PeFirst, pe.lastName AS PeLast, 
       p.homeCity
FROM People p
JOIN Customers c ON p.pid = c.pid
JOIN People pe ON p.homeCity = pe.homeCity
JOIN Agents a ON pe.pid = a.pid
WHERE p.pid != pe.pid; -- makes sure not same person


-- Difference: uses <> and abbreviations that don't make sense ; AI answer 7/10
SELECT c.firstName AS CustomerFirst, c.lastName AS CustomerLast, 
       a.firstName AS AgentFirst, a.lastName AS AgentLast, 
       c.homeCity
FROM People c
JOIN Customers cu ON c.pid = cu.pid
JOIN People a ON c.homeCity = a.homeCity
JOIN Agents ag ON a.pid = ag.pid
WHERE c.pid <> a.pid;



