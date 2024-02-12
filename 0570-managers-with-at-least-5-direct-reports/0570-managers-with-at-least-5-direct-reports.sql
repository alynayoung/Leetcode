WITH m AS (
    SELECT m.name
        , COUNT(e.id) AS cnt
    FROM Employee AS e
        LEFT JOIN Employee AS m ON e.managerID = m.Id
    GROUP BY m.name
)

SELECT name
FROM m
WHERE cnt >= 5