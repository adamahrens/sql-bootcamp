/* Timestamps  datatype for column */
SELECT payment_id, extract(day from payment_date)
FROM payment
LIMIT 5

/* Group by month, amount sold */
SELECT SUM(amount) as total, extract(month from payment_date) as month_sold
FROM payment
GROUP BY month_sold
ORDER BY total DESC

SELECT customer_id + rental_id as cr_id
FROM payment

SELECT first_name || ' ' || last_name as full_name
FROM customer
ORDER BY full_name ASC

SELECT first_name || ' ' || last_name as full_name, md5(email || last_name || first_name)
FROM customer
ORDER BY full_name ASC

SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film)
ORDER BY title ASC

/* Return films that were rented between a specific date range */
SELECT film_id, title
FROM film
WHERE film_id IN (SELECT inventory.film_id
FROM rental
JOIN inventory on inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-09' AND '2005-05-30')

/* SELF Join */
/* first_name matches a last_name */
SELECT C1.first_name, C1.last_name, C2.first_name, C2.last_name
FROM customer AS C1, customer AS C2
WHERE C1.first_name = C2.last_name

SELECT C1.customer_id, C1.first_name || ' ' || C1.last_name, C2.customer_id, C2.first_name || ' ' || C2.last_name
FROM customer AS C1, customer AS C2
WHERE C1.first_name = C2.last_name

SELECT C1.customer_id, (C1.first_name || ' ' || C1.last_name) AS full_name, C2.customer_id, (C2.first_name || ' ' || C2.last_name) AS full_name
FROM customer AS C1, customer AS C2
WHERE C1.first_name = C2.last_name
