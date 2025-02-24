-- ANASTASIA LAPERUTA, 2/24/2025, LAB4-QUERIES2


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
 


-- Difference: ; AI answer /10





-- 3. my answer

-- Difference: ; AI answer /10





-- 4. my answer


-- Difference: ; AI answer /10





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
