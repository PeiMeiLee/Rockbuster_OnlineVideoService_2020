--Merge columns from multiple data sets
--Calculate rental duration for each rental (in seconds)

WITH rental_duration_cte AS
(SELECT 
rental_id,
inventory_id,
customer_id,
rental_date,
return_date,
EXTRACT (EPOCH FROM(return_date - rental_date)) AS rental_duration
FROM rental
 )
SELECT *
FROM rental_duration_cte A
LEFT JOIN inventory B ON A.inventory_id = B.inventory_id
LEFT JOIN film C ON B.film_id = C.film_id
LEFT JOIN film_category G ON C.film_id = G.film_id
LEFT JOIN category H ON G.category_id = H.category_id

--Export result as CSV
--Convert the unit for rental duration from seconds to hours using EXCEL
--Import EXCEL file to TABLEAU to create bar charts











