class Solution:
    def merge(self, intervals: list[list[int]]) -> list[list[int]]:
        """Merge all overlapping intervals.

        Args:
            intervals: A list of [start, end] pairs.

        Returns:
            The intervals after merging overlaps.
        """

        if not intervals:
            return []

        intervals.sort(key=lambda x: x[0])
        result = []
        the_interval = intervals[0]

        for interval in intervals[1:]:
            if interval[0] <= the_interval[1]:
                the_interval[1] = max(the_interval[1], interval[1])
            else:
                result.append(the_interval)
                the_interval = interval

        result.append(the_interval)
        return result





