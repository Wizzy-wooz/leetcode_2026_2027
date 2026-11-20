class Solution:
    def threeSum(self, nums: list[int]) -> list[list[int]]:
        # Time: O(n^2) overall: sorting takes O(n log n), then the two-pointer scans take O(n^2).
        # Extra space: O(n) for Python's in-place sort; the returned triplets use O(k) space.
        # Sorting lets the two pointers move according to whether the sum is too small or too large.
        nums.sort()
        # Store each valid combination as a three-number list.
        triplets = []
        # Cache the length for loop bounds and the initial right pointer.
        n = len(nums)

        # Fix nums[i]; range(n - 2) ensures two indices remain to its right.
        for i in range(n - 2):
            # Skip duplicate fixed values to avoid generating the same triplets again.
            if i > 0 and nums[i] == nums[i - 1]:
                continue

            # Start at the first and last available values in the remaining suffix.
            left = i + 1
            right = n - 1

            # Each step moves at least one pointer, so this scan is linear for this i.
            while left < right:
                # Compare the current three-number sum with the target, zero.
                total = nums[i] + nums[left] + nums[right]

                if total == 0:
                    # Record this unique triplet, then move both pointers inward.
                    triplets.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1

                    # Skip repeated values so the same triplet is not added again.
                    # Compare with the previous value because the pointers just moved.
                    while left < right and nums[left] == nums[left - 1]:
                        left += 1
                    while left < right and nums[right] == nums[right + 1]:
                        right -= 1
                elif total < 0:
                    # The sum is too small; a larger left value may bring it to zero.
                    left += 1
                else:
                    # The sum is too large; a smaller right value may bring it to zero.
                    right -= 1

        # Return all unique triplets found across the fixed starting values.
        return triplets



