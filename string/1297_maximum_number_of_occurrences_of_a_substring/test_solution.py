import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxFreq('aababcaab', 2, 3, 4)
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().maxFreq('aaaa', 1, 3, 3)
        self.assertEqual(actual, 2)


if __name__ == "__main__":
    unittest.main()
