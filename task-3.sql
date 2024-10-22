-- 1.Кількість фільмів у кожній категорії:

SELECT c.name AS category_name, 
       COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY c.name;

-- 2.Середня тривалість фільмів по категоріях:

SELECT c.name AS category_name, 
       AVG(f.length) AS avg_length
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY c.name;

-- 3.Мінімальна та максимальна тривалість фільмів:

SELECT MIN(length) AS min_length, 
       MAX(length) AS max_length
FROM film;

-- 4.Загальна кількість клієнтів:

SELECT COUNT(*) AS total_customers
FROM customer;

-- 5.Сума платежів по кожному клієнту:

SELECT c.first_name, 
       c.last_name, 
       SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_payments DESC;

-- 6.Топ-5 клієнтів за сумою платежів:

SELECT c.first_name, 
       c.last_name, 
       SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_payments DESC
LIMIT 5;

-- 7.Кількість орендованих фільмів по клієнтах:

SELECT c.first_name, 
       c.last_name, 
       COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC;

-- 8.Середній вік фільмів:

SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - release_year) AS avg_film_age
FROM film;

-- 9.Кількість орендованих фільмів за період:

SELECT COUNT(*) AS rental_count
FROM rental
WHERE rental_date BETWEEN '2005-07-01' AND '2005-08-01';

-- 10.Сума платежів по місяцях:

SELECT DATE_TRUNC('month', payment_date) AS month,
       SUM(amount) AS total_amount
FROM payment
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;

-- 11.Максимальна сума платежу по клієнтах:

SELECT c.first_name, 
       c.last_name, 
       MAX(p.amount) AS max_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY max_payment DESC;

-- 12.Середня сума платежів по клієнтах:

SELECT c.first_name, 
       c.last_name, 
       AVG(p.amount) AS avg_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY avg_payment DESC;

-- 13.Кількість фільмів по рейтингах:

SELECT rating, 
       COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY rating;

-- 14.Середня сума платежів по магазинах:

SELECT s.store_id, 
       AVG(p.amount) AS avg_payment
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY s.store_id;