-- ANASTASIA LAPERUTA, 3/11/2025, LAB6-QUERIES4


-- 1. my answer
SELECT city,
count( prodId ),
       RANK() OVER(ORDER BY count( prodId ) DESC)
FROM Products
GROUP BY city;


-- Difference: added comment restating question, formatting, used DISTINCT and aliases; AI answer 10/10
-- 1. Display the cities that make the most different kinds of products. Experiment with the rank() function.
SELECT city, COUNT(DISTINCT prodId) AS product_count, 
       RANK() OVER (ORDER BY COUNT(DISTINCT prodId) DESC) AS rank
FROM Products
GROUP BY city;







-- 2. my answer
 SELECT name
FROM Products
WHERE priceUSD < .01 * (SELECT AVG(priceUSD) From Products)
ORDER BY name ASC;



-- Difference: added comment restating question, did multiplication inside of select; AI answer 10/10
-- 2. Display the names of products whose priceUSD is less than 1% of the average priceUSD, in alphabetical order.
SELECT name 
FROM Products
WHERE priceUSD < (SELECT AVG(priceUSD) * 0.01 FROM Products)
ORDER BY name ASC;




-- 3. my answer
SELECT People.lastName, Orders.prodId, Orders.totalUSD
FROM Orders
INNER JOIN People on Orders.custId = People.pid
WHERE date_part('month', dateOrdered) = 03
ORDER BY totalUSD ASC;

-- Difference: added comment restating question, didn't specify inner, used 3 without 0; AI answer /10
-- 3. Display the customer last name, product id ordered, and totalUSD for all orders made in March of any year, sorted by totalUSD from low to high.
SELECT p.lastName, o.prodId, o.totalUSD
FROM Orders o
JOIN Customers c ON o.custId = c.pid
JOIN People p ON c.pid = p.pid
WHERE EXTRACT(MONTH FROM o.dateOrdered) = 3
ORDER BY o.totalUSD ASC;





-- 4. my answer
SELECT lastName
FROM People
WHERE pid IN (SELECT pid
			   FROM Customers)
ORDER by lastName DESC;


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



