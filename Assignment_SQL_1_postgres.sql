-- Q1: Write a query to show the album titles in ascending order.

SELECT title
FROM album
ORDER BY title


-- Q2: How many artists names start with B?

SELECT COUNT(*) AS artists_starts_B 
FROM artist
WHERE name LIKE 'B%'


-- Q3: What’s the customers name whose city is Oslo?

SELECT first_name, last_name
FROM customer
WHERE city = 'Oslo'


-- Q4: How many customers do we have from Canada?

SELECT COUNT(*)
FROM customer
WHERE country = 'Canada'


-- Q5: What’s the average track unit price?

SELECT avg(unit_price) AS average_price
FROM track


-- Q6: What’s the sum of invoice total per billing country?

SELECT billing_country AS country, sum(total) AS invoice_total
FROM invoice
GROUP BY billing_country


-- Q7: Show the only 3 employees whose last names start with P

SELECT *
FROM employee
WHERE last_name LIKE 'P%'
LIMIT 3

/*
 Here, in original employee table we have only 8 employees and
 only 2 of them have last names with first letter P, so, LIMIT 3
 actually do nothing in this concrete example
*/