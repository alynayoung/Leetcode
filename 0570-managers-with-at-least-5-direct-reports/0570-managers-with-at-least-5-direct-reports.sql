SELECT name
FROM Employee
WHERE ID IN (
    SELECT managerID
    FROM Employee
    GROUP BY managerID
    Having count(*) >= 5
)