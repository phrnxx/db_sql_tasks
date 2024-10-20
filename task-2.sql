// 1. Запит на вибірку фільмів і їх категорій
SELECT 
    f.title AS "Назва фільма",
    f.length AS "Тривалість",
    c.name AS "Категорія"
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
ORDER BY c.name, f.title;
// 2. Топ-5 найпопулярніших фільмів
SELECT 
    f.title AS "Назва фільма",
    COUNT(r.rental_id) AS "Кількість оренд"
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY COUNT(r.rental_id) DESC
LIMIT 5;
// 3. Фільми, орендовані певним клієнтом
SELECT 
    f.title AS "Назва фільма",
    r.date_rented AS "Дата оренди",
    r.return_date AS "Дата повернення",
    CONCAT(c.first_name, ' ', c.last_name) AS "Клієнт"
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.customer_id = 1
ORDER BY r.date_rented DESC;
// 4. Додавання нового клієнта
INSERT INTO customer (first_name, last_name, address, city)
VALUES ('Alice', 'Cooper', '123 Main St', 'San Francisco');
// 5. Оновлення адреси клієнта
UPDATE customer
SET address = '456 Elm St'
WHERE first_name = 'Alice' AND last_name = 'Cooper';
// 6. Видалення клієнта
DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';
