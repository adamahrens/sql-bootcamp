/* Select all columns from actor limit result to 10 */
SELECT *
FROM actor
LIMIT 10

/* Specify columns to retrieve */
SELECT first_name, last_name
FROM actor
LIMIT 10

/* Challenge: Send promotional emails to existing customers */
SELECT first_name, last_name, email
FROM customer
ORDER BY first_name

/* Fetching distinct values */
SELECT DISTINCT rating
FROM film

SELECT DISTINCT release_year
FROM film

/* 4.99, 0.99, 2.99 */
SELECT DISTINCT rental_rate
FROM film

SELECT DISTINCT rental_rate
FROM film
ORDER BY rental_rate DESC

/* Challenge: What values of rating types do we have on our films? */
SELECT DISTINCT rating
FROM film

/* Use Where to filter results */
SELECT last_name, first_name
FROM actor
WHERE first_name = 'Dan'

SELECT *
FROM payment
WHERE amount < 8 AND amount > 6

SELECT SUM(amount) as total_amount
FROM payment
WHERE amount <= 4.99

/* Format as currency */
SELECT cast(SUM(amount) as money)
FROM payment
WHERE amount <= 4.99

/* Challenge: Find email for customer named Nancy Thomas */
SELECT email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas'

/* Challenge: What is the movie Outlaw Hanky about? */
SELECT description
FROM film
WHERE title = 'Outlaw Hanky'

/* Challenge: Get phone number for customer at 259 Ipoh Drive */
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive'

/* How many transactions have occurred? */
SELECT COUNT(*)
FROM payment

/* ASC by default, otherwise DESC */
SELECT first_name, last_name
FROM customer
ORDER BY first_name

SELECT first_name, last_name
FROM customer
ORDER BY first_name, last_name ASC

/* Challenge: Get customer IDs for top ten highest paid amounts */
SELECT customer_id, amount
FROM payment
ORDER BY amount DESC, customer_id ASC
LIMIT 10

/* Challenge: Get titles of films with ids 1-5 */
SELECT title, film_id
FROM film
ORDER BY film_id
LIMIT 5

SELECT film_id, title
FROM film
WHERE film_id BETWEEN 1 AND 5

SELECT film_id, title
FROM film
WHERE film_id BETWEEN 1 AND 5
ORDER BY title DESC

SELECT customer_id, amount
FROM payment
WHERE amount NOT BETWEEN 8 AND 9

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id in (1,2)
ORDER BY return_date DESC

SELECT *
FROM customer
WHERE first_name LIKE 'Jen%'

/* Challenge: How many transactions greater than 5.00?  3,618 */
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.00

/* Challenge:  How many actors first name start with P? 5*/
SELECT COUNT(first_name)
FROM actor
WHERE first_name LIKE 'P%'

/* Case insensitive */
SELECT COUNT(first_name)
FROM actor
WHERE first_name ILIKE 'p%'

/* Challenge: How many unique districts are customers from? 378 */
SELECT COUNT(DISTINCT(district)) unique_districts
FROM address

/* Challenge: Retrieve list of names from those Unique districts */
SELECT DISTINCT(district)
FROM address
ORDER BY district

/* Challenge: How many films have a rating of R cost between $5 and $15 */
SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 and 15
