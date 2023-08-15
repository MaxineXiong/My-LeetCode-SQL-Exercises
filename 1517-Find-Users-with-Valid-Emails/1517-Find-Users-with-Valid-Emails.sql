----Solution to LeetCode Database question 1517: Find Users With Valid E-Mails

SELECT *
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][0-9a-zA-Z_.-]*@leetcode\\.com$')

-- \\: escape special characters
-- ^: beginning of string
-- $: end of string
