from typing import List
class Solution:
    def distinctAverages(self, nums: List[int]) -> int:
        nums.sort()

        left = 0
        right = len(nums) - 1
        averages = set()

        while left < right:
            avg = (nums[left] + nums[right]) / 2
            averages.add(avg)
            left += 1
            right -= 1

        return len(averages)