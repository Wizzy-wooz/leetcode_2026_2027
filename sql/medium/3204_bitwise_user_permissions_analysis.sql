-- 3204. Bitwise User Permissions Analysis
-- https://leetcode.com/problems/bitwise-user-permissions-analysis/
--
-- user_permissions(user_id, permissions)
-- Consider that each bit in the permissions integer represents a different access level or
-- feature that a user has.
-- Write a solution to calculate the following:
-- common_perms: The access level granted to all users. This is computed using a bitwise AND
-- operation on the permissions column.
-- any_perms: The access level granted to any user. This is computed using a bitwise OR operation
-- on the permissions column.
-- Return the result table in any order.

SELECT
  BIT_AND(permissions) AS common_perms,
  BIT_OR(permissions) AS any_perms
FROM user_permissions;
