-- 2051. The Category of Each Member in the Store
-- https://leetcode.com/problems/the-category-of-each-member-in-the-store/
--
-- Members(member_id, name)
-- Visits(visit_id, member_id, visit_date)
-- Purchases(visit_id, charged_amount)
-- A store wants to categorize its members. There are three tiers:
-- "Diamond": if the conversion rate is greater than or equal to 80.
-- "Gold": if the conversion rate is greater than or equal to 50 and less than 80.
-- "Silver": if the conversion rate is less than 50.
-- "Bronze": if the member never visited the store.
-- The conversion rate of a member is (100 * total number of purchases for the member) / total
-- number of visits for the member.
-- Write a solution to report the id, the name, and the category of each member.
-- Return the result table in any order.

SELECT
  m.member_id,
  name,
  CASE
    WHEN COUNT(v.visit_id) = 0
    THEN 'Bronze'
    WHEN 100 * COUNT(charged_amount) / NULLIF(COUNT(v.visit_id), 0) >= 80
    THEN 'Diamond'
    WHEN 100 * COUNT(charged_amount) / NULLIF(COUNT(v.visit_id), 0) >= 50
    THEN 'Gold'
    ELSE 'Silver'
  END AS category
FROM Members AS m
LEFT JOIN Visits AS v
  ON m.member_id = v.member_id
LEFT JOIN Purchases AS p
  ON v.visit_id = p.visit_id
GROUP BY
  m.member_id,
  name;
