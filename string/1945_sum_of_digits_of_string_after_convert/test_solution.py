import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().getLucky('iiii', 1)
        self.assertEqual(actual, 36)

    def test_example_2(self):
        actual = Solution().getLucky('leetcode', 2)
        self.assertEqual(actual, 6)

    def test_example_3(self):
        actual = Solution().getLucky('zbax', 2)
        self.assertEqual(actual, 8)


if __name__ == "__main__":
    unittest.main()
