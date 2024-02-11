SELECT e.name
FROM Employee AS e 
    LEFT JOIN Employee AS m ON e.id=m.managerId 
GROUP BY m.managerId 
HAVING COUNT(m.managerId) >= 5