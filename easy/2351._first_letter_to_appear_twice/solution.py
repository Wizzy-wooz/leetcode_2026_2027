class Solution:
    def repeatedCharacter(self, s: str) -> str:
        seen = set()
        for char in s:
            if char in seen:
                return char
            seen.add(char)
        raise ValueError("Input must contain at least one repeated character")
