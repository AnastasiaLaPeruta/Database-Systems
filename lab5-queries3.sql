-- ANASTASIA LAPERUTA, 3/3/2025, LAB5-QUERIES3


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


-- Difference: ; AI answer /10






-- 9. my answer



-- Difference: ; AI answer /10






-- 10. my answer


-- Difference: ; AI answer /10


