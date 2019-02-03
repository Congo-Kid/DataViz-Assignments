
-- Question 1
-- Like concat in Pandas. Basically stacks info on top as long as info in columns is same,
-- Meaning same data type. UNION REMOVES ALL DUPLICATES
USE sakila;

SELECT COUNT(*)
FROM city
UNION
SELECT COUNT(*)
FROM country;


-- Question 2

-- Use union to display from the tables customer and customer_list 
-- the ID of all customers who live in the city of London. Determine 
-- whether both tables contain the same customers by using UNION ALL.
-- UNION ALL DOE NOT REMOVE DUPLICATES

SELECT customer_id
FROM customer
WHERE address_id IN
(
  SELECT address_id
  FROM address
  WHERE city_id IN
  (
    SELECT city_id
    FROM city
    WHERE city = 'London'
  )
)
UNION ALL
SELECT id
FROM customer_list
WHERE city = 'London';
