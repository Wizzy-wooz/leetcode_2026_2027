from ast import List


class Solution:
    def findSubarrays(self, nums: List[int]) -> bool:
        sett = set()

        for i in range(0, len(nums) - 1):
            count = nums[i] + nums[i + 1]
            if count in sett:
                return True
            sett.add(count)

        return False