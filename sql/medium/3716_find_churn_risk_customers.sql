-- 3716. Find Churn Risk Customers
-- https://leetcode.com/problems/find-churn-risk-customers/
--
-- subscription_events(event_id, user_id, event_date, event_type, plan_name, monthly_amount)
-- Write a solution to Find Churn Risk Customers - users who show warning signs before churning. A
-- user is considered churn risk customer if they meet ALL the following criteria:
-- Currently have an active subscription (their last event is not cancel).
-- Have performed at least one downgrade in their subscription history.
-- Their current plan revenue is less than 50% of their historical maximum plan revenue.
-- Have been a subscriber for at least 60 days.
-- Return the result table ordered by days_as_subscriber in descending order, then by user_id in
-- ascending order.

WITH user_with_last_event AS (
  SELECT
    s.*,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date DESC, event_id DESC) AS rn
  FROM subscription_events AS s
), user_history AS (
  SELECT
    user_id,
    MIN(event_date) AS start_date,
    MAX(event_date) AS last_event_date,
    MAX(monthly_amount) AS max_historical_amount,
    SUM(CASE WHEN event_type = 'downgrade' THEN 1 ELSE 0 END) AS downgrade_count
  FROM subscription_events
  GROUP BY
    user_id
), latest_event AS (
  SELECT
    user_id,
    event_type AS last_event_type,
    plan_name AS current_plan,
    monthly_amount AS current_monthly_amount
  FROM user_with_last_event
  WHERE
    rn = 1
)
SELECT
  l.user_id,
  l.current_plan,
  l.current_monthly_amount,
  h.max_historical_amount,
  DATE_DIFF('DAY', h.start_date, h.last_event_date) AS days_as_subscriber
FROM latest_event AS l
JOIN user_history AS h
  ON l.user_id = h.user_id
WHERE
  l.last_event_type <> 'cancel'
  AND h.downgrade_count >= 1
  AND l.current_monthly_amount < 0.5 * h.max_historical_amount
  AND DATE_DIFF('DAY', h.start_date, h.last_event_date) >= 60
ORDER BY
  days_as_subscriber DESC,
  l.user_id ASC NULLS FIRST;
