/* Aggregate */
SELECT customer_id, CAST(AVG(amount) as money)
FROM payment
GROUP BY customer_id
ORDER BY customer_id

/* Number of decimal places to round */
SELECT ROUND(AVG(amount), 3)
FROM payment

SELECT MAX(amount)
FROM payment

SELECT COUNT(amount)
FROM payment
WHERE amount = 0.0

SELECT customer_id, SUM(amount) as total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC

SELECT staff_id, COUNT(rental_id) as total_transactions
FROM payment
GROUP BY staff_id

SELECT staff_id, COUNT(rental_id) as total_transactions, SUM(amount) as total_sold
FROM payment
GROUP BY staff_id
ORDER BY total_transactions DESC

SELECT rating, COUNT(film_id) as total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC

/* Challenge: Average replacement cost by rating */
SELECT rating, ROUND(AVG(replacement_cost), 2) as average_rental
FROM film
GROUP BY rating
ORDER BY average_rental DESC

/* Challenge: Customer ids for top 5 spenders */
SELECT customer_id, SUM(amount) as total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5

/* Having: Condition for GROUP BY, takes effect after GROUP BY, WHERE filters rows BEFORE GROUP By is applied */
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 100.0
ORDER BY SUM(amount) DESC

SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300
ORDER BY COUNT(customer_id) DESC

SELECT rating, ROUND(AVG(rental_rate),2)
FROM film
WHERE rating IN ('R', 'NC-17', 'PG-13')
GROUP BY rating
HAVING AVG(rental_rate) < 3.0

/* Challenge: Find customers with at least 40 transactions for new bonus */
SELECT customer_id, COUNT(rental_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(rental_id) >= 40
ORDER BY COUNT(rental_id) DESC

/* Challenge: When grouped by rating which has an average rental rate more than 5 days? */
SELECT rating, ROUND(AVG(rental_duration), 1)
FROM film
GROUP BY rating
HAVING AVG(rental_duration) > 5
