import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minWindow('ADOBECODEBANC', 'ABC')
        self.assertEqual(actual, 'BANC')

    def test_example_2(self):
        actual = Solution().minWindow('a', 'a')
        self.assertEqual(actual, 'a')

    def test_example_3(self):
        actual = Solution().minWindow('a', 'aa')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
