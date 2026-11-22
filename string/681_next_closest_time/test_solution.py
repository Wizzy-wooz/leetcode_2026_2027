import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().nextClosestTime('19:34')
        self.assertEqual(actual, '19:39')

    def test_example_2(self):
        actual = Solution().nextClosestTime('23:59')
        self.assertEqual(actual, '22:22')


if __name__ == "__main__":
    unittest.main()
