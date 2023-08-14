----Solution to LeetCode Database question 1098: Unpopular Books

WITH scopped_books AS
(
  SELECT book_id, name
  FROM Books
  WHERE available_from NOT BETWEEN DATE_ADD('2019-06-23', INTERVAL -1 MONTH) AND '2019-06-23'
),
orders_in_scope AS
(
  SELECT o.book_id, o.quantity
  FROM Orders AS o
  JOIN scopped_books AS sb
  ON o.book_id = sb.book_id
  WHERE o.dispatch_date BETWEEN DATE_ADD('2019-06-23', INTERVAL -1 YEAR) AND '2019-06-23'
)

SELECT sb.book_id, sb.name
FROM scopped_books AS sb
LEFT JOIN orders_in_scope AS os
ON sb.book_id = os.book_id
GROUP BY sb.book_id
HAVING SUM(IFNULL(os.quantity, 0)) < 10
