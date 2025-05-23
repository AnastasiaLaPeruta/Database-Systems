-- ANASTASIA LAPERUTA, 2/25/2025, LAB4-QUERIES2


-- 1. my answer
SELECT *                                                    
FROM People  
WHERE pid IN (  
    SELECT pid  
    FROM Customers  
); 


-- Difference: formatting & wrote out question as a comment; AI answer 9/10
-- 1. Get all the People data for people who are customers.
SELECT *
FROM People
WHERE pid IN (SELECT pid FROM Customers);






-- 2. my answer
SELECT *  
FROM People  
WHERE pid IN (  
    SELECT pid  
    FROM Agents  
); 
 


-- Difference: formatting & wrote out question as a comment; AI answer 9/10
-- 2. Get all the People data for people who are agents.
SELECT *
FROM People
WHERE pid IN (SELECT pid FROM Agents);





-- 3. my answer
SELECT *  
FROM People  
WHERE pid IN (  
    SELECT pid  
    FROM Customers  
    INTERSECT  
    SELECT pid  
    FROM Agents  
); 
 

-- Difference: formatting & wrote out question as a comment; AI answer 9/10
-- 3. Get all of People data for people who are both customers and agents.
SELECT *
FROM People
WHERE pid IN (SELECT pid FROM Customers)
  AND pid IN (SELECT pid FROM Agents);





-- 4. my answer
SELECT *  
FROM People  
WHERE pid NOT IN (  
    SELECT pid  
    FROM Customers  
    UNION  
    SELECT pid  
    FROM Agents  
); 


-- Difference: used AND instead of UNION & wrote out question as a comment; AI answer 9/10
-- 4. Get all of People data for people who are neither customers nor agents.
SELECT *
FROM People
WHERE pid NOT IN (SELECT pid FROM Customers)
  AND pid NOT IN (SELECT pid FROM Agents);






-- 5. my answer
SELECT pid  
FROM Customers  
WHERE pid IN (  
    SELECT custid  
    FROM Orders
	WHERE prodid = 'p01'
    UNION 
    SELECT custid  
    FROM Orders
	WHERE prodid = 'p03'
)
ORDER BY pid ASC; 


-- Difference: different method of retrieval that is less code & wrote out question as a comment; AI answer 10/10
-- 5. Get the ID of customers who ordered either product p01 or p03 (or both).
--    List the IDs in order from lowest to highest. Include each ID only once.
SELECT DISTINCT custId
FROM Orders
WHERE prodId IN ('p01', 'p03')
ORDER BY custId ASC;






-- 6. my answer
SELECT pid  
FROM Customers  
WHERE pid IN (  
    SELECT custid  
    FROM Orders
	WHERE prodid = 'p01'
    INTERSECT 
    SELECT custid  
    FROM Orders
	WHERE prodid = 'p03'
)
ORDER BY pid DESC; 

-- Difference: used AND instead of INTERSECT, formatting & wrote out question as a comment; AI answer 10/10
-- 6. Get the ID of customers who ordered both products p01 and p03.
--    List the IDs in order from highest to lowest. Include each ID only once.
SELECT DISTINCT custId
FROM Orders
WHERE custId IN (SELECT custId FROM Orders WHERE prodId = 'p01')
  AND custId IN (SELECT custId FROM Orders WHERE prodId = 'p03')
ORDER BY custId DESC;





-- 7. my answer
SELECT firstName, lastName  
FROM People  
WHERE pid IN (  
    SELECT agentid  
    FROM Orders
	WHERE prodid = 'p05'
    UNION 
    SELECT agentid  
    FROM Orders
	WHERE prodid = 'p07'
)
ORDER BY lastName ASC; 


-- Difference: used IN instead of UNION & wrote out question as a comment; AI answer 10/10
-- 7. Get the first and last names of agents who sold products p05 or p07,
--    in order by last name from A to Z.
SELECT firstName, lastName
FROM People
WHERE pid IN (
      SELECT agentId
      FROM Orders
      WHERE prodId IN ('p05', 'p07')
)
ORDER BY lastName ASC;






-- 8. my answer
SELECT DISTINCT homeCity, DOB  
FROM People  
WHERE pid IN (  
    SELECT agentid  
    FROM Orders
    WHERE custid = '007'
)
ORDER BY homeCity DESC; 


-- Difference: no quotes & wrote out question as a comment; AI answer 10/10
-- 8. Get the home city and birthday of agents booking an order for the customer whose pid is 007,
--    sorted by home city from Z to A.
SELECT DISTINCT homeCity, DOB
FROM People
WHERE pid IN (
      SELECT agentId
      FROM Orders
      WHERE custId = 007
)
ORDER BY homeCity DESC;






-- 9. my answer
SELECT DISTINCT prodid
FROM Orders
WHERE agentid IN (
	SELECT agentid 
	FROM Orders
	WHERE custid IN (
		SELECT pid
		FROM People
		WHERE homeCity = 'Saginaw'
	)
)
ORDER BY prodid DESC;



-- Difference: Capitalization & wrote out question as a comment; AI answer 10/10
-- 9. Get the unique ids of products ordered through any agent who takes at least one order
--    from a customer in Saginaw, sorted by id from highest to lowest.
SELECT DISTINCT prodId
FROM Orders
WHERE agentId IN (
      SELECT agentId
      FROM Orders
      WHERE custId IN (
            SELECT pid
            FROM People
            WHERE homeCity = 'Saginaw'
      )
)
ORDER BY prodId DESC;






-- 10. my answer
SELECT lastName, homeCity
FROM People
WHERE pid IN (
	SELECT pid      -- realized after seeing AI answer that this was unnecessary 
	FROM Customers  --but maybe this is just a good check to have to guarantee that we are actually looking at valid customer pids
	WHERE pid IN (
		SELECT custid
		FROM Orders 
		WHERE agentid IN (
			SELECT pid 
			FROM People
			WHERE homeCity = 'Regina' OR homeCity = 'Pinner'
		)
	)
)
ORDER BY lastName ASC;


-- Difference: Less subqueries, used IN insead of OR, wrote out question as comment, & used DISTINCT; AI answer 10/10
-- 10. Get the last name and home city for all customers who place orders through agents
--     in Regina or Pinner, in order by last name from A to Z.
SELECT DISTINCT lastName, homeCity
FROM People
WHERE pid IN (
      SELECT custId
      FROM Orders
      WHERE agentId IN (
            SELECT pid
            FROM People
            WHERE homeCity IN ('Regina', 'Pinner')
      )
)
ORDER BY lastName ASC;

