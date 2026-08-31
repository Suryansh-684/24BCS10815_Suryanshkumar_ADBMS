WITH weekly_touches AS ( 
  SELECT DISTINCT 
    contact_id, 
    DATE_TRUNC('week', 
event_date)::date AS touch_week 
  FROM marketing_touches 
), 
streaks AS ( 
  SELECT 
    contact_id, 
    touch_week, 
    touch_week - (ROW_NUMBER() 
OVER ( 
      PARTITION BY contact_id 
      ORDER BY touch_week 
    ) * INTERVAL '1 week') AS 
grp 
  FROM weekly_touches ), 
  qualified_streaks AS ( 
  SELECT contact_id 
  FROM streaks 
  GROUP BY contact_id, grp 
  HAVING COUNT(*) >= 3 
), 
trial_contacts AS ( 
  SELECT DISTINCT contact_id 
  FROM marketing_touches 
  WHERE event_type = 
'trial_request' 
) 
SELECT c.email 
FROM crm_contacts c 
JOIN qualified_streaks qs 
  ON c.contact_id = qs.contact_id 
JOIN trial_contacts tc 
  ON c.contact_id = tc.contact_id 
ORDER BY c.email;