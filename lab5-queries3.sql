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



-- Difference: ; AI answer /10






-- 6. my answer



-- Difference: ; AI answer /10





-- 7. my answer


-- Difference: ; AI answer /10






-- 8. my answer


-- Difference: ; AI answer /10






-- 9. my answer



-- Difference: ; AI answer /10






-- 10. my answer


-- Difference: ; AI answer /10


