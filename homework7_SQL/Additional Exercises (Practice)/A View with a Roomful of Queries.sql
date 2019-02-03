SELECT COUNT(*) FROM inventory;

SELECT title, 
(SELECT COUNT(*) 
FROM inventory 
WHERE film.film_id = inventory.film_id ) 
AS '# of copies'
FROM film 
ORDER BY title;

-- OR

select title, count(*)
from
(
select title
from film, inventory
where film.film_id = inventory.film_id) a
group by title
;
