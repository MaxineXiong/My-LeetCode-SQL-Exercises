### 603. Consecutive Available Seats

Table: `cinema`

```markdown
+-------------+------+
| Column Name | Type |
+-------------+------+
| seat_id     | int  |
+-------------+------+
seat_id is an auto-increment primary key column for this table.
Each row of this table indicates whether the ith seat is free or not. 1 means free while 0 means occupied.
```

<br/>

Write an SQL query to report all the consecutive available seats in the cinema.

Return the result table **ordered** by `seat_id` in **ascending** order.

The test cases are generated so that more than two seats are consecutively available.

The query result format is in the following example.

<br/>

**Example 1:**

```markdown
Cinema table:
+---------+------+
| seat_id | free |
+---------+------+
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
+---------+------+

output:
+---------+
| seat_id |
+---------+
| 3       |
| 4       |
| 5       |
+---------+
```

<br/>

Refer to **603-consecutive-available-seats.sql** for my solution.
