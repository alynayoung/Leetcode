WITH first_play AS (
    SELECT player_id, MIN(event_date) AS first_day
    FROM Activity
    GROUP BY player_id
)
, next_day_play AS (
    SELECT a.player_id
    FROM Activity a
    JOIN first_play fp ON a.player_id = fp.player_id
    WHERE a.event_date = DATE_ADD(fp.first_day, INTERVAL 1 DAY)
)
SELECT ROUND(COUNT(next_day_play.player_id) / COUNT(first_play.player_id), 2) AS fraction
FROM first_play
LEFT JOIN next_day_play ON first_play.player_id = next_day_play.player_id;
