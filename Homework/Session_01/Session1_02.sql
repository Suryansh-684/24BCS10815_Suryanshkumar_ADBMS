SELECT COUNT(*) AS payment_count 
FROM ( 
    SELECT 
      transaction_id, 
      transaction_timestamp, 
      LAG(transaction_timestamp) 
OVER ( 
          PARTITION BY 
merchant_id, credit_card_id, amount 
          ORDER BY 
transaction_timestamp 
      ) AS prev_timestamp 
    FROM transactions 
) t 
WHERE prev_timestamp IS NOT NULL 
  AND transaction_timestamp <= 
prev_timestamp + INTERVAL '10 
minutes';