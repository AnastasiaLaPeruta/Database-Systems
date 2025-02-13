-- ANASTASIA LAPERUTA, 2/13/2025, LAB3-QUERIES1


SELECT ordernum, totalusd -- 1. my answer
FROM Orders;

SELECT orderNum, totalUSD -- Difference: capitalization; AI answer 10/10
FROM Orders;





SELECT lastname, homecity -- 2. my answer
FROM People
WHERE prefix = 'Ms.'; 

SELECT lastName, homeCity -- Difference: capitalization; AI answer 10/10
FROM People
WHERE prefix = 'Ms.';





SELECT prodid, name, qtyonhand -- 3. my answer
FROM Products
WHERE qtyonhand > 1007;

SELECT prodId, name, qtyOnHand -- Difference: capitalization; AI answer 10/10
FROM Products
WHERE qtyOnHand > 1007;





SELECT firstname, homecity -- 4. my answer
FROM People
WHERE dob > '1939-12-31' AND dob < '1950-01-01';

SELECT firstName, homeCity -- Difference: capitalization & use of BETWEEN ; AI answer 10/10
FROM People
WHERE DOB BETWEEN '1940-01-01' AND '1949-12-31';





SELECT prefix, lastname -- 5. my answer
FROM People
WHERE prefix != 'Mr.';

SELECT prefix, lastName -- Difference: capitalization & use of <> ; AI answer 10/10
FROM People
WHERE prefix <> 'Mr.';





SELECT * -- 6. my answer
FROM Products
where city != 'Dallas' AND city != 'Duluth' 
AND priceusd <= 17.00;

SELECT * -- Difference: capitalization & use of NOT IN () ; AI answer 10/10
FROM Products
WHERE city NOT IN ('Dallas', 'Duluth')
AND priceUSD <= 17.00;





SELECT * -- 7. my answer
FROM Orders
WHERE EXTRACT(MONTH FROM dateordered) = '01';

SELECT * -- Difference: capitalization & no use of '' ; AI answer 10/10
FROM Orders
WHERE EXTRACT(MONTH FROM dateOrdered) = 1;





SELECT * -- 8. my answer
FROM Orders
WHERE EXTRACT(MONTH FROM dateOrdered) = 2
AND totalusd >= 23000;

SELECT * -- Difference: capitalization; AI answer 10/10
FROM Orders
WHERE EXTRACT(MONTH FROM dateOrdered) = 2
AND totalUSD >= 23000;





SELECT * -- 9. my answer
FROM Orders
WHERE custid = 010;

SELECT * -- Difference: capitalization; AI answer 10/10
FROM Orders
WHERE custId = 010;





SELECT * -- 10. my answer
FROM Orders
WHERE custId = 005;

SELECT * -- Difference: None; AI answer 10/10
FROM Orders
WHERE custId = 005;
