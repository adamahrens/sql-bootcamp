/* Renaming columns with AS */
SELECT SUM(amount) AS total_sold
FROM payment

SELECT customer_id, SUM(amount) AS total_sold
FROM payment
GROUP BY customer_id
ORDER BY total_sold DESC
LIMIT 10

/* INNER, OUTER, SELF JOINS */
/* JOIN ON , will need to specify tableName.columnName */
SELECT customer.customer_id, first_name, last_name, email, SUM(amount) AS spent
FROM customer
JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY spent DESC

/* first part of on has to be the table you're joing with */
SELECT title, description, language.name
FROM film
JOIN language ON language.language_id = film.language_id

SELECT first_name, last_name, SUM(amount)
FROM staff
JOIN payment ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name

SELECT title, COUNT(title) as total_copies, store_id
FROM film
JOIN inventory ON inventory.film_id = film.film_id
GROUP BY title, store_id
ORDER BY title ASC

SELECT film.film_id, title, inventory_id
FROM film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL

SELECT film.film_id, title, inventory_id
FROM film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory_id IS NULL
ORDER BY title

/* UNION */
/* Combine two select statements from two tables
/* Must have same number of columns and the columns must be the same data type */

SELECT actor.actor_id as id, first_name, last_name, COUNT(title) as total_movies
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
GROUP BY actor.actor_id
ORDER BY total_movies DESC
