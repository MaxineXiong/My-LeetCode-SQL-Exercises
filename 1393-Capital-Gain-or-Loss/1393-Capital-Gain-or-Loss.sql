----Solution to LeetCode Database question 1393: Capital Gain/Loss

WITH stocks_new AS
(
  SELECT *, IF(operation = 'buy', -1, 1) AS operator
  FROM Stocks
),
gain_loss AS
(
  SELECT ROW_NUMBER() OVER (PARTITION BY stock_name ORDER BY operation_day) AS id,
         stock_name, operation, operation_day, price,
         SUM(price * operator) OVER (PARTITION BY stock_name ORDER BY operation_day) AS capital_gain_loss
  FROM stocks_new
  ORDER BY stock_name, operation_day
)


SELECT stock_name, capital_gain_loss
FROM gain_loss
WHERE (stock_name, id) IN (SELECT stock_name, MAX(id)
                           FROM gain_loss
                           GROUP BY stock_name)
