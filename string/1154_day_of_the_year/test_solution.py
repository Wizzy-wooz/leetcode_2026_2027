import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().dayOfYear('2019-01-09')
        self.assertEqual(actual, 9)

    def test_example_2(self):
        actual = Solution().dayOfYear('2019-02-10')
        self.assertEqual(actual, 41)


if __name__ == "__main__":
    unittest.main()
