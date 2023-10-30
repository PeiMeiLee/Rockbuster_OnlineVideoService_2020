-- Calculate total amount of payments per country
-- Merge columns from multiple data sets

SELECT 
  D.country,
  SUM(E.amount) AS total_sales
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
GROUP BY country
ORDER BY total_sales DESC;

-- Export result as CSV
-- Import CSV to Tableau to create a treemap showing total sales per country
