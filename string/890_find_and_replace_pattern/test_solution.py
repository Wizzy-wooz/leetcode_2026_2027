import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findAndReplacePattern(['abc', 'deq', 'mee', 'aqq', 'dkd', 'ccc'], 'abb')
        self.assertEqual(actual, ['mee', 'aqq'])

    def test_example_2(self):
        actual = Solution().findAndReplacePattern(['a', 'b', 'c'], 'a')
        self.assertEqual(actual, ['a', 'b', 'c'])


if __name__ == "__main__":
    unittest.main()
