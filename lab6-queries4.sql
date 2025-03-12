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
SELECT People.lastName, coalesce(Orders.totalUSD, 0) AS total
FROM People
INNER JOIN Customers ON People.pid = Customers.pid
LEFT OUTER JOIN Orders ON Customers.pid = Orders.custId
ORDER by lastName DESC;

-- Difference: summed the totals for each person, added comment, used multiple aliases, used different joins; AI answer 10/10
-- 4. Display the last name of all customers (in reverse alphabetical order) and their total ordered by customer, using COALESCE to avoid NULL totals.
SELECT p.lastName, COALESCE(SUM(o.totalUSD), 0) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.pid = o.custId
JOIN People p ON c.pid = p.pid
GROUP BY p.lastName
ORDER BY p.lastName DESC;








-- 5. my answer
SELECT pe.firstName AS cust_name, pr.name AS prod_name, pe2.firstName AS agent_name
FROM People pe
INNER JOIN Customers c ON pe.pid = c.pid 
INNER JOIN Orders o ON c.pid = o.custId
INNER JOIN Products pr ON o.prodId = pr.prodId
INNER JOIN People pe2 ON o.agentId = pe2.pid
WHERE pe2.homeCity = 'Regina';


-- Difference: wrote out full name, added comment, different FROM table and order of joins, not specify inner, different alias names; AI answer 10/10
-- 5. Display the names of all customers who bought products from agents based in Regina along with the names of the products they ordered, and the names of the agents who sold them.
SELECT DISTINCT c.firstName || ' ' || c.lastName AS customer_name,
       p.name AS product_name,
       a.firstName || ' ' || a.lastName AS agent_name
FROM Orders o
JOIN Customers cu ON o.custId = cu.pid
JOIN People c ON cu.pid = c.pid
JOIN Products p ON o.prodId = p.prodId
JOIN Agents ag ON o.agentId = ag.pid
JOIN People a ON ag.pid = a.pid
WHERE a.homeCity = 'Regina';






-- 6. my answer
SELECT ROUND(o.quantityOrdered * p.priceUSD, 2) AS actual_total, O.totalUSD
FROM Products p
INNER JOIN Orders o on p.prodId = o.prodId
WHERE ROUND(o.quantityOrdered * p.priceUSD, 2) != o.totalUSD;

The prices were not accounting for discount percentage that certain customers receive.



-- Difference: added comment, select is different, used <>; AI answer 10/10
-- 6. Check accuracy of Orders.totalUSD by calculating it from other tables.
SELECT o.orderNum, o.totalUSD AS recorded_total,
       ROUND(o.quantityOrdered * p.priceUSD, 2) AS calculated_total
FROM Orders o
JOIN Products p ON o.prodId = p.prodId
WHERE ROUND(o.quantityOrdered * p.priceUSD, 2) <> o.totalUSD;




-- 7. my answer
SELECT firstName, lastName
FROM People p
INNER JOIN Customers c ON p.pid = c.pid
INNER JOIN Agents a ON c.pid = a.pid;

-- Difference: added comment, used p (I forgot to specify), just said JOIN, did agents join differently; AI answer 10/10
-- 7. Display the first and last name of all customers who are also agents.
SELECT p.firstName, p.lastName
FROM People p
JOIN Customers c ON p.pid = c.pid
JOIN Agents a ON p.pid = a.pid;




-- 8. my answer
CREATE view PeopleCustomers AS
SELECT p.pid, prefix, firstName, lastName, suffix, homeCity, DOB, paymentTerms, discountPct
FROM People p
FULL OUTER JOIN Customers c ON p.pid = c.pid;

CREATE view PeopleAgents AS
SELECT p.pid, prefix, firstName, lastName, suffix, homeCity, DOB, paymentTerms, commissionPct
FROM People p
FULL OUTER JOIN Agents a ON p.pid = a.pid;

SELECT *
FROM PeopleCustomers;

SELECT *
FROM PeopleAgents;


-- Difference: interpreted question to mean only show people who are customers and then people who are agents, used alias to prefix every column in select statement,
-- added comments; AI answer 4/10
-- 8. Create a VIEW of all Customer and People data called PeopleCustomers, and another VIEW of all Agent and People data called PeopleAgents.
CREATE VIEW PeopleCustomers AS
SELECT p.pid, p.firstName, p.lastName, p.homeCity, c.paymentTerms, c.discountPct
FROM People p
JOIN Customers c ON p.pid = c.pid;

CREATE VIEW PeopleAgents AS
SELECT p.pid, p.firstName, p.lastName, p.homeCity, a.paymentTerms, a.commissionPct
FROM People p
JOIN Agents a ON p.pid = a.pid;

-- Test the views
SELECT * FROM PeopleCustomers;
SELECT * FROM PeopleAgents;






-- 9. my answer




-- Difference:; AI answer /10








-- 10. my answer


-- Difference:; AI answer /10



