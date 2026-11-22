import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().mostCommonWord('Bob hit a ball, the hit BALL flew far after it was hit.', ['hit'])
        self.assertEqual(actual, 'ball')

    def test_example_2(self):
        actual = Solution().mostCommonWord('a.', [])
        self.assertEqual(actual, 'a')


if __name__ == "__main__":
    unittest.main()
