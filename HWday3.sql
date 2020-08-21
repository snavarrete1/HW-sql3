--1.List all customers who live in Texas 
SELECT first_name, last_name, district 
FROM address
JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';

--2.Get all payments above 6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3.Show all customers names who have made payments over $175
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--4.List all customers that live in Nepal
SELECT customer.first_name, customer.last_name, customer.email, country.country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5.Which staff member had the most transactions
SELECT first_name, last_name, staff.staff_id, COUNT(payment_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
--Answer is Mike Hillyer and Jon Stephens

--6.How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;
--Answer is NC-17(210), G(178), PG(194), PG-13(223), R(195)

--7.Show all customers who have made a single payment
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
);

--8.How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;
--Answer is 24