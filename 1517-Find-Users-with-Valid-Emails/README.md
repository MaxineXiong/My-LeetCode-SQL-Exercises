### 1517. Find Users With Valid E-Mails

Table: `Users`

```markdown
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+
user_id is the primary key for this table.
This table contains information of the users signed up in a website. Some e-mails are invalid.
```

<br/>

Write a SQL query to find the users who have **valid emails**.

A valid e-mail has a prefix name and a domain where:

- **The prefix name** is a string that may contain letters (upper or lower case), digits, underscore ‘`_`’, period ‘`.`’, and/or ‘`-`’. The prefix name **must** start with a letter.
- The **domain** is ‘`@leetcode.com`’.

Return the result table in **any order**.

The query result format is in the following example.

<br/>

**Example 1:**

```markdown
Input:
Users table:
+----------+-----------+-------------------------+
| user_id  | name      | mail                    |
+----------+-----------+-------------------------+
| 1        | Winston   | winston@leetcode.com    |
| 2        | Janothan  | jonathanisgreat         |
| 3        | Annabelle | bella-@leetcode.com     |
| 4        | Sally     | sally.com@leetcode.com  |
| 5        | Marwan    | quarz#2020@leetcode.com |
| 6        | David     | david69@gmail.com       |
| 7        | Shapiro   | .shapo@leetcode.com     |
+----------+-----------+-------------------------+

Output:
+----------+-----------+-------------------------+
| user_id  | name      | mail                    |
+----------+-----------+-------------------------+
| 1        | Winston   | winston@leetcode.com    |
| 3        | Annabelle | bella-@leetcode.com     |
| 4        | Sally     | sally.com@leetcode.com  |
+----------+-----------+-------------------------+

Explanation:
The mail of user 2 does not have a domain.
The mail of user 5 has the # sign which is not allowed.
The mail of user 6 does not have the leetcode domain.
The mail of user 7 starts with a period.
```

<br/>

Refer to **1517-Find-Users-with-Valid-Emails.sql** for my solution.
