import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimumCost('i love leetcode', 12)
        self.assertEqual(actual, 36)

    def test_example_2(self):
        actual = Solution().minimumCost('apples and bananas taste great', 7)
        self.assertEqual(actual, 21)

    def test_example_3(self):
        actual = Solution().minimumCost('a', 5)
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
