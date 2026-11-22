import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxTotal([9, 2, 6, 1], '0101')
        self.assertEqual(actual, 15)

    def test_example_2(self):
        actual = Solution().maxTotal([5, 1, 4], '001')
        self.assertEqual(actual, 4)

    def test_example_3(self):
        actual = Solution().maxTotal([9, 3, 5], '011')
        self.assertEqual(actual, 14)


if __name__ == "__main__":
    unittest.main()
