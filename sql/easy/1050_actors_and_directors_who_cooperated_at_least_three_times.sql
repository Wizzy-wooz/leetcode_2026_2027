-- 1050. Actors and Directors Who Cooperated At Least Three Times
-- https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
--
-- ActorDirector(actor_id, director_id, timestamp)
-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated
-- with the director at least three times.
-- Return the result table in any order.

SELECT
  actor_id,
  director_id
FROM ActorDirector
GROUP BY
  1,
  2
HAVING
  COUNT(1) >= 3;
