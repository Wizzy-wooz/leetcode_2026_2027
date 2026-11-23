-- 1693. Daily Leads and Partners
-- https://leetcode.com/problems/daily-leads-and-partners/
--
-- DailySales(date_id, make_name, lead_id, partner_id)
-- For each date_id and make_name, find the number of distinct lead_id's and distinct
-- partner_id's.
-- Return the result table in any order.

SELECT
  date_id,
  make_name,
  COUNT(DISTINCT lead_id) AS unique_leads,
  COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY
  1,
  2;
