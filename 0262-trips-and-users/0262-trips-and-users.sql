SELECT t.request_at AS Day
     , ROUND(COUNT(DISTINCT CASE WHEN t.status LIKE '%cancelled%' THEN t.id END) / COUNT(DISTINCT t.id),2) AS 'Cancellation Rate'
FROM Trips AS t
      LEFT JOIN Users AS d ON t.driver_id = d.users_id
      LEFT JOIN Users AS c ON t.client_id = c.users_id
WHERE d.banned = 'NO' AND c.banned = 'NO'
  AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at






