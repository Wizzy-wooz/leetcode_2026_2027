import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().getSmallestString('zbbz', 3)
        self.assertEqual(actual, 'aaaz')

    def test_example_2(self):
        actual = Solution().getSmallestString('xaxcd', 4)
        self.assertEqual(actual, 'aawcd')

    def test_example_3(self):
        actual = Solution().getSmallestString('lol', 0)
        self.assertEqual(actual, 'lol')


if __name__ == "__main__":
    unittest.main()
