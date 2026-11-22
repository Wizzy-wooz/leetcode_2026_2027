class Solution:
    def checkString(self, s: str) -> bool:
        """Return whether every 'a' appears before every 'b'."""
        return s.find("ba") == -1