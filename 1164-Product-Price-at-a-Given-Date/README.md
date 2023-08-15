### 1164. Product Price at a Given Date

Table: `Products`

```markdown
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| product_id     | int      |
| new_price      | int      |
| change_date    | date     |
+----------------+----------+
(product_id, new_price) is the primary key of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
```

<br/>

Write an SQL query to find the prices of all products on `2019-08-16`. Assume the price of all products before any change is `10`.

Return the result table in **any order**.

The query result format is in the following example.

<br/>

**Example 1:**

```markdown
Products table:
+------------+------------+---------------+
| product_id | new_price  | chnage_date   |
+------------+------------+---------------+
| 1          | 20         | 2019-08-14    |
| 2          | 50         | 2019-08-14    |
| 1          | 30         | 2019-08-15    |
| 1          | 35         | 2019-08-16    |
| 2          | 65         | 2019-08-17    |
| 3          | 20         | 2019-08-18    |
+------------+------------+---------------+

output:
+------------+--------+
| product_id | price  |
+------------+--------+
| 1          | 50     |
| 2          | 35     |
| 5          | 10     |
+------------+--------+
```

<br/>

Refer to **1164-Product-Price-at-a-Given-Date.sql** for my solution.
