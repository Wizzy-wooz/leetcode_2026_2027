import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimumCost('abcdef', ['abdef', 'abc', 'd', 'def', 'ef'], [100, 1, 1, 10, 5])
        self.assertEqual(actual, 7)

    def test_example_2(self):
        actual = Solution().minimumCost('aaaa', ['z', 'zz', 'zzz'], [1, 10, 100])
        self.assertEqual(actual, -1)


if __name__ == "__main__":
    unittest.main()
