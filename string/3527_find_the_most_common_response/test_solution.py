import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findCommonResponse([['good', 'ok', 'good', 'ok'], ['ok', 'bad', 'good', 'ok', 'ok'], ['good'], ['bad']])
        self.assertEqual(actual, 'good')

    def test_example_2(self):
        actual = Solution().findCommonResponse([['good', 'ok', 'good'], ['ok', 'bad'], ['bad', 'notsure'], ['great', 'good']])
        self.assertEqual(actual, 'bad')


if __name__ == "__main__":
    unittest.main()
