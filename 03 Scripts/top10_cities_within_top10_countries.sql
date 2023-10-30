--  Top 10 cities that fall within any of the top 10 countries identified in previous step

SELECT D.country,
    C.city,
    COUNT(customer_id) AS count_customers
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
WHERE D.country IN (
    SELECT D.country
    FROM customer A
    INNER JOIN address B ON A.address_id = B.address_id
    INNER JOIN city C ON B.city_id = C.city_id
    INNER JOIN country D ON C.country_id = D.country_id
    GROUP BY D.country
    ORDER BY COUNT(A.customer_id) DESC
    LIMIT 10
)
GROUP BY D.country, C.city
ORDER BY COUNT(customer_id) DESC
LIMIT 10;
