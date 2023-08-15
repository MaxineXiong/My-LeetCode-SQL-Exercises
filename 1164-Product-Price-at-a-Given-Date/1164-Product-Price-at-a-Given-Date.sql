----Solution to LeetCode Database question 1164: Product Price at a Given Date

WITH CTE1 AS
(
  SELECT product_id, change_date, new_price,
         LEAD(change_date, 1) OVER (PARTITION BY product_id ORDER BY change_date) AS next_date
  FROM Products
  ORDER BY product_id, change_date
),
CTE2 AS
(
  SELECT product_id, MIN(change_date) AS first_date, MAX(change_date) AS last_date
  FROM Products
  GROUP BY product_id
),
CTE3 AS
(
  SELECT product_id, last_date, CASE WHEN first_date > '2019-08-16' THEN 10
                                     WHEN last_date < '2019-08-16' THEN 0
                                     ELSE NULL
                                END AS label
  FROM CTE2
),
Part1 AS
(
  SELECT p.product_id, IF(label = 0, p.new_price, label) AS price
  FROM
  (
    SELECT * FROM CTE3
    WHERE label IS NOT NULL
  ) AS a
  JOIN Products AS p
  ON a.last_date = p.change_date AND a.product_id = p.product_id
),
Part2 AS
(
  SELECT product_id, CASE WHEN (change_date = '2019-08-16') OR (change_date < '2019-08-16' AND next_date > '2019-08-16')
                          THEN new_price
                          ELSE NULL END AS price
  FROM CTE1
  WHERE product_id NOT IN (SELECT product_id FROM Part1)
)



SELECT * FROM Part2
WHERE price IS NOT NULL

UNION

SELECT * FROM Part1
