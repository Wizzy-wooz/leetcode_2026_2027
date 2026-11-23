-- 3451. Find Invalid IP Addresses
-- https://leetcode.com/problems/find-invalid-ip-addresses/
--
-- logs(log_id, ip, status_code)
-- Write a solution to find invalid IP addresses. Each octet in an IP address contains between 1
-- and 3 digits. An IPv4 address is invalid if it meets any of these conditions:
-- Contains a number greater than 255 in any octet.
-- Has leading zeros in any octet (for example, 01.02.03.04).
-- Has fewer or more than 4 octets.
-- Return the result table ordered by invalid_count, ip in descending order respectively.

SELECT
  ip,
  COUNT(*) AS invalid_count
FROM logs
WHERE
  NOT REGEXP_FULL_MATCH(ip, '(0|[1-9][0-9]{0,2})([.](0|[1-9][0-9]{0,2})){3}')
  OR LIST_MAX(LIST_TRANSFORM(STR_SPLIT(ip, '.'), LAMBDA v : TRY_CAST(v AS INT))) > 255
GROUP BY
  ip
ORDER BY
  invalid_count DESC,
  ip DESC;
