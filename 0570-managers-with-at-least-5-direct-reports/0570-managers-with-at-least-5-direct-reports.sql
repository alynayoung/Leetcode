WITH ManagerEmployeeCount AS (
    SELECT e.managerId,
           COUNT(e.id) AS employee_count
    FROM Employee AS e
    GROUP BY e.managerId
)

SELECT m.name AS name
FROM Employee AS m
JOIN ManagerEmployeeCount AS mec ON m.id = mec.managerId
WHERE mec.employee_count >= 5;