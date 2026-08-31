WITH cte AS (
  SELECT
      policy_holder_id,
      call_date,
      LAG(call_date) OVER (
          PARTITION BY policy_holder_id
          ORDER BY call_date
      ) AS prev_call_date
  FROM callers
)
SELECT COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM cte
WHERE prev_call_date IS NOT NULL
  AND call_date <= prev_call_date + INTERVAL '7 days';
