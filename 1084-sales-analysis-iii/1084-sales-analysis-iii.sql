SELECT s.product_id
     , p.product_name
FROM Sales AS s
        LEFT JOIN Product AS p ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING min(s.sale_date) >= '2019-01-01' AND max(s.sale_date) <= '2019-03-31'