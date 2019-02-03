USE sakila;

# What is the average cost to rent a film in the Sakila stores?
SELECT AVG(rental_rate) as 'Average Rental Rate'
	FROM film;
    
# What is the average rental cost of films by rating? 
# On average, what is the cheapest rating of films to rent? Most expensive?
SELECT rating, AVG(rental_rate) AS 'Average rental rate'
FROM film
GROUP BY rating
ORDER BY AVG(rental_rate);



SELECT SUM(rental_rate) as 'replacement cost' FROM film;

# How much would it cost to replace all the films in each ratings category?
# On average, what is the cheapest rating of films to rent? Most expensive?
SELECT rating, SUM(rental_rate) as 'replacement cost' FROM film
GROUP By rating;

-- How long is the longest movie in the database? The shortest?
SELECT MAX(length)
FROM film;

SELECT MIN(length)
FROM film;

select title, length from film
where length in (select min(length) from film);

-- 6. For customers with id numbers 1 through 4, display the total amount they have paid.
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING customer_id < 5;


