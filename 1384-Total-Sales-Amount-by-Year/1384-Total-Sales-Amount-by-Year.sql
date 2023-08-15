----Solution to LeetCode Database question 1384: Total Sales Amount by Year

WITH sales_products AS
(
  SELECT s.product_id, p.product_name, s.period_start, s.period_end, s.average_daily_sales
  FROM Sales AS s
  JOIN Product AS p
  ON s.product_id = p.product_id
),
report_years AS
(
  SELECT DISTINCT a.report_year
  FROM (
          SELECT YEAR(period_start) AS report_year
          FROM Sales
          UNION
          SELECT YEAR(period_end) AS report_year
          FROM Sales
       ) AS a
),
results_start_year AS
(
  SELECT x.product_id, x.product_name, y.report_year,
         CASE WHEN x.period_start >= MAKEDATE(y.report_year, 1)
              THEN IF(x.period_end < MAKEDATE(y.report_year + 1, 1),
                      (ABS(DATEDIFF(x.period_start, x.period_end)) + 1) * x.average_daily_sales,
                      (ABS(DATEDIFF(x.period_start, MAKEDATE(y.report_year + 1, 1)))) * x.average_daily_sales)
              ELSE IF(x.period_end < MAKEDATE(y.report_year + 1, 1),
                      (ABS(DATEDIFF(MAKEDATE(y.report_year, 1), x.period_end)) + 1) * x.average_daily_sales,
                      (ABS(DATEDIFF(MAKEDATE(y.report_year, 1), MAKEDATE(y.report_year + 1, 1)))) * x.average_daily_sales)
         END AS total_amount
  FROM sales_products AS x
  CROSS JOIN report_years AS y
  WHERE x.period_start < MAKEDATE(y.report_year + 1, 1) AND x.period_end >= MAKEDATE(y.report_year, 1)
)


SELECT product_id, product_name, CAST(report_year AS char) AS report_year, total_amount
FROM results_start_year
ORDER BY product_id, report_year
