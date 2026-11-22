import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestToChar('loveleetcode', 'e')
        self.assertEqual(actual, [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0])

    def test_example_2(self):
        actual = Solution().shortestToChar('aaab', 'b')
        self.assertEqual(actual, [3, 2, 1, 0])


if __name__ == "__main__":
    unittest.main()
