WITH cte AS(
    SELECT requester_id AS user_id
         , COUNT(requester_id) AS count1
    FROM RequestAccepted
    GROUP BY requester_id
UNION ALL
    SELECT accepter_id AS user_id
         , COUNT(accepter_id) AS count1
    FROM RequestAccepted
    GROUP BY accepter_id
    )

SELECT user_id AS id
     , sum(count1) AS num
FROM cte
GROUP BY id
ORDER BY num DESC
LIMIT 1