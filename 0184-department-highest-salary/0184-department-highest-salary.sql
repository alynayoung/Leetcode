SELECT d.name AS Department
     , e.name AS Employee
     , e.salary AS Salary
FROM Employee AS e
      LEFT JOIN Department AS d ON e.departmentId = d.id
WHERE (d.id, e.salary) IN (
    SELECT departmentId
         , MAX(salary)
    FROM Employee
    GROUP BY departmentId
)