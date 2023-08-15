----Solution to LeetCode Database question 1270: All People Report to the Given Manager

WITH RECURSIVE Management AS
(
  SELECT employee_id, 1 AS level
  FROM Employees
  WHERE manager_id = 1 AND employee_id <> 1

  UNION All

  SELECT e.employee_id, m.level + 1 AS level
  FROM Employees AS e
  JOIN Management AS m
  ON e.manager_id = m.employee_id
  WHERE level <= 3
)

SELECT employee_id FROM Management
