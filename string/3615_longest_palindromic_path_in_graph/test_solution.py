import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxLen(3, [[0, 1], [1, 2]], 'aba')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().maxLen(3, [[0, 1], [0, 2]], 'abc')
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().maxLen(4, [[0, 2], [0, 3], [3, 1]], 'bbac')
        self.assertEqual(actual, 3)


if __name__ == "__main__":
    unittest.main()
