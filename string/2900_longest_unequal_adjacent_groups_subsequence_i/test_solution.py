import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example(self):
        self.assertEqual(Solution().getLongestSubsequence(['a','b'], [0,1]), ['a', 'b'])


if __name__ == "__main__":
    unittest.main()
