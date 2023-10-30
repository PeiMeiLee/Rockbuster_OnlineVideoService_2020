-- Calculate total amount of payments per customer
-- Merge columns from multiple data sets to gain geographical insights

SELECT A.customer_id, 
A.first_name,
A.last_name,
D.country,
C.city,
SUM(E.amount) AS total_amount_paid
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
GROUP BY A.customer_id, D.country, C.city
ORDER BY total_amount_paid DESC;

-- Export result as CSV
-- Find customer lifetime value range in Excel
-- Import CSV to Tableau to create a treemap showing top customers with the highest lifetime value