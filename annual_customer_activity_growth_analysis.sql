--Subtask 1
--Show amount of average monthly active (MAU) user per year.
WITH mau AS(SELECT
				DATE_PART('month', o.order_purchase_timestamp) AS month,
				DATE_PART('year', o.order_purchase_timestamp) AS year,
				COUNT(DISTINCT c.customer_unique_id) AS monthly_active_user
			FROM orders AS o
			JOIN customers AS c ON c.customer_id = o.customer_id
			GROUP BY 1, 2
		   )
SELECT
	year,
	ROUND(AVG(monthly_active_user), 2) AS average_mau
FROM mau
GROUP BY 1
ORDER BY 1 ASC;

--Subtask 1
--Show new customer (first time transaction) per year.
WITH new_customers AS(SELECT
					  	MIN(o.order_purchase_timestamp) AS first_order,
					 	c.customer_unique_id
					  FROM orders AS o
					  JOIN customers AS c ON c.customer_id = o.customer_id
					  GROUP BY 2
					 )	
SELECT
	DATE_PART('year', first_order) AS year,
	COUNT(1) AS new_customers
FROM new_customers
GROUP BY 1
ORDER BY 1 ASC;

--Subtask 3
--Show amount of customer who orders more than one (repeat order) per year.
WITH repeat_order AS(SELECT
						DATE_PART('year', o.order_purchase_timestamp) AS year,
					 	c.customer_unique_id AS customer_repeat,
						COUNT(o.order_id) AS total_order
					FROM orders AS o
					JOIN customers AS c ON c.customer_id = o.customer_id
					GROUP BY 1, 2
					HAVING COUNT(o.order_id) > 1
					)
SELECT
	year,
	COUNT(DISTINCT customer_repeat) AS repeat_customers
FROM repeat_order
GROUP BY 1;

--Subtask 4
--Show average orders of customer per year.
WITH orders AS(SELECT
			  	c.customer_unique_id AS customer,
			   	DATE_PART('year', o.order_purchase_timestamp) AS year,
			   	COUNT(1) AS frequency_purchase
			  FROM orders AS o
			  JOIN customers AS c ON c.customer_id = o.customer_id
			  GROUP BY 1, 2
			  )
SELECT
	year,
	ROUND(AVG(frequency_purchase), 3) AS average_orders
FROM orders
GROUP BY 1
ORDER BY 1 ASC;

--Subtask 5
--Group 3 metrics in one display table
WITH mau AS(SELECT
				year,
				ROUND(AVG(monthly_active_user), 1) AS average_mau
			FROM(SELECT
				 	DATE_PART('month', o.order_purchase_timestamp) AS month,
				 	DATE_PART('year', o.order_purchase_timestamp) AS year,
				 	COUNT(DISTINCT c.customer_unique_id) AS monthly_active_user
				 FROM orders AS o
				 JOIN customers AS c ON c.customer_id = o.customer_id
				 GROUP BY 1, 2
				 ) AS subq
			GROUP BY 1
),
new_customers AS(SELECT
				 	year,
				 	COUNT(new_customers) AS new_customers
				 FROM(SELECT
					  	MIN(DATE_PART('year', o.order_purchase_timestamp)) AS year,
					 	c.customer_unique_id AS new_customers
					  FROM orders AS o
					  JOIN customers AS c ON c.customer_id = o.customer_id
					  GROUP BY 2
					  ) AS subq
				 GROUP BY 1
),
repeat_order AS(SELECT
					year,
					COUNT(DISTINCT customer_repeat) AS repeat_customers
				FROM(SELECT
					 	DATE_PART('year', o.order_purchase_timestamp) AS year,
					 	c.customer_unique_id AS customer_repeat,
						COUNT(o.order_id) AS total_order
					 FROM orders AS o
					 JOIN customers AS c ON c.customer_id = o.customer_id
					 GROUP BY 1, 2
					 HAVING COUNT(o.order_id) > 1
					 ) AS subq
				GROUP BY 1
),
avg_orders AS(SELECT
			  	year,
			  	AVG(total_order) AS average_orders
			  FROM(SELECT
				   	DISTINCT c.customer_unique_id AS customer,
				   	DATE_PART('year', o.order_purchase_timestamp) AS year,
			   		COUNT(DISTINCT o.order_id) AS total_order
				   FROM orders AS o
				   JOIN customers AS c ON c.customer_id = o.customer_id
				   GROUP BY 1, 2
				   ) AS subq
			  GROUP BY 1
)
SELECT 
	m.year AS year,
	average_mau,
	new_customers,
	repeat_customers,
	average_orders
FROM mau AS m
JOIN new_customers AS nc ON nc.year = m.year
JOIN repeat_order AS ro ON ro.year = m.year
JOIN avg_orders AS ao ON ao.year = m.year
GROUP BY 1, 2, 3, 4, 5;

