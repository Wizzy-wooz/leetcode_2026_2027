class Solution:
    def addSpaces(self, s: str, spaces: list[int]) -> str:
        res = []
        start = 0

        for idx in spaces:
            res.append(s[start:idx])
            start = idx

        res.append(s[start:])

        return " ".join(res)
