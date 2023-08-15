----Solution to LeetCode Database question 1321: Restaurant Growth

SELECT *
FROM (
        SELECT visited_on, SUM(SUM(amount)) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
               ROUND(AVG(SUM(amount)) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
        FROM Customer
        GROUP BY visited_on
     ) AS x
WHERE x.visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM Customer), INTERVAL 6 DAY)
