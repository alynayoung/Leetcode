WITH first_activity AS (
    SELECT player_id
         , MIN(event_date) AS first_event_date
    FROM Activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a
INNER JOIN first_activity f ON a.player_id = f.player_id
WHERE a.event_date = DATE_ADD(f.first_event_date, INTERVAL 1 DAY)