----Solution to LeetCode Database question 1484: Group Sold Products By The Date

SELECT x.sell_date, y.num_sold, x.products
FROM (
       SELECT sell_date, GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
       FROM Activities
       GROUP BY sell_date
     ) AS x
JOIN
     (
       SELECT sell_date, COUNT(*) AS num_sold
       FROM (SELECT DISTINCT * FROM Activities)
       GROUP BY sell_date
     ) AS y
ON x.sell_date = y.sell_date
