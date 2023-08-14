----Solution to LeetCode Database question 603: Consecutive Available Seats

SELECT x.seat_id
FROM
    (
      SELECT seat_id, free,
             LAG(free, 1) OVER (ORDER BY seat_id) AS prev_free,
             LEAD(free, 1) OVER (ORDER BY seat_id) AS next_free
      FROM cinema
    ) AS x
WHERE (x.free = 1 AND x.prev_free = 1) OR (x.free = 1 AND x.next_free = 1)
ORDER BY x.seat_id
