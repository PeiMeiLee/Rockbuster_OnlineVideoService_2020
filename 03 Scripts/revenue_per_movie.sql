-- Calculate total revenue per movie
-- Merge columns from multiple data sets

SELECT 
  A.film_id,
  B.title,
  SUM(amount) AS total_sales
FROM inventory A
LEFT JOIN film B ON A.film_id = B.film_id
LEFT JOIN rental C ON A.inventory_id = C.inventory_id
LEFT JOIN payment D ON C.rental_id = D.rental_id
GROUP BY A.film_id,B.title
ORDER BY total_sales;

-- Export result as CSV
-- Import CSV to Tableau to create a bar chart showing the Top 10 movies per revenue
-- Import CSV to Tableau to create a bar chart showing the Bottom 10 movies per revenue

--Calculate the average revenue
WITH total_sales_cte AS
  (SELECT 
  A.film_id,
  B.title,
  SUM(amount) AS total_sales
FROM inventory A
LEFT JOIN film B ON A.film_id = B.film_id
LEFT JOIN rental C ON A.inventory_id = C.inventory_id
LEFT JOIN payment D ON C.rental_id = D.rental_id
GROUP BY A.film_id,B.title
ORDER BY total_sales)

SELECT 
AVG(total_sales)
FROM total_sales_cte;






