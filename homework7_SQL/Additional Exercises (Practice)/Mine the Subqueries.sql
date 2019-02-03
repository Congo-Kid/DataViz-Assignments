-- Using subqueries, identify all actors who appear in the film 
-- Alter Victory in the sakila database.
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
  SELECT actor_id
  FROM film_actor
  WHERE film_id IN
  (
   SELECT film_id
   FROM film
   WHERE title = 'ALTER VICTORY'
  )
);




-- Using subqueries, display the titles of films that the employee, 
-- Jon Stephens, rented to customers.



SELECT title
	FROM film
	WHERE film_id
	IN (
		SELECT film_id
			FROM inventory
			WHERE inventory_id
			IN (
				SELECT inventory_id
					FROM rental
					WHERE staff_id
						IN (
							SELECT staff_id
								FROM staff
								WHERE last_name = "Stephens" AND first_name = "Jon"
							)
				)
		);





-- BONUS: For problem No. 2, refine the Jon Stephens query to select 
-- for films that were rented on May 31st, and whose titles begin with the letter C.


-- Hint: you may wish to look into using wildcards in MySQL.

SELECT title
	FROM film
    WHERE film_id
    IN (
      SELECT film_id
        FROM inventory
        WHERE inventory_id
        IN (
          SELECT inventory_id
            FROM rental
            WHERE staff_id
            IN (
              SELECT staff_id
                FROM staff
                WHERE first_name = "Jon" AND last_name = "Stephens"
              )
              AND rental_date LIKE '%05-31%'
            )
              )
            AND title LIKE 'C%';
