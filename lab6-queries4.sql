-- ANASTASIA LAPERUTA, 3/11/2025, LAB6-QUERIES4


-- 1. my answer
SELECT city,
count( prodId ),
       RANK() OVER(ORDER BY count( prodId ) DESC)
FROM Products
GROUP BY city;


-- Difference: added comments restating question, formatting, used DISTINCT and aliases; AI answer 10/10
-- 1. Display the cities that make the most different kinds of products. Experiment with the rank() function.
SELECT city, COUNT(DISTINCT prodId) AS product_count, 
       RANK() OVER (ORDER BY COUNT(DISTINCT prodId) DESC) AS rank
FROM Products
GROUP BY city;







-- 2. my answer
 


-- Difference:; AI answer /10





-- 3. my answer
 

-- Difference:; AI answer /10






-- 4. my answer


-- Difference:; AI answer /10








-- 5. my answer



-- Difference:; AI answer /10







-- 6. my answer




-- Difference:; AI answer /10





-- 7. my answer


-- Difference:; AI answer /10





-- 8. my answer



-- Difference:; AI answer /10






-- 9. my answer




-- Difference:; AI answer /10








-- 10. my answer


-- Difference:; AI answer /10



