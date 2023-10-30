-- Top 5 customers in any of the top 10 cities who’ve paid the highest total amounts to Rockbuster

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
HAVING C.city IN (
	SELECT C.city
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
	LIMIT 10
	)
ORDER BY total_amount_paid DESC
LIMIT 5;
