With CTE As(
    SELECT requester_id
        , accepter_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id , requester_id
    FROM RequestAccepted
    )

select requester_id as id
     , count(requester_id) as num
from CTE
group by requester_id
order by num desc
limit 1
