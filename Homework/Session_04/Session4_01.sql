WITH latest_txn AS 
  ( SELECT 
    user_id, 
    MAX(transaction_date) AS 
transaction_date 
  FROM user_transactions 
  GROUP BY user_id 
) 
SELECT 
  l.transaction_date, 
  l.user_id, 
  COUNT(u.product_id) AS 
purchase_count 
FROM latest_txn l 
JOIN user_transactions u 
  ON l.user_id = u.user_id 
  AND l.transaction_date = 
u.transaction_date 
GROUP BY l.transaction_date, 
l.user_id 
ORDER BY l.transaction_date, 
l.user_id;