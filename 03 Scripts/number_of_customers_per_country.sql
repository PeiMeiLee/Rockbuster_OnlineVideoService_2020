-- Calculate number of customers in each country

SELECT 
D.country,
COUNT(DISTINCT customer_id) AS count_customers
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY country
ORDER BY count_customers DESC;

-- Export result as CSV
-- Import CSV to Tableau to create a map visualizing the ranking of countries with the most countries
-- Use Tableau to create a frequency table showing that there are fewer than 10 customers in most countries
