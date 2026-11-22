import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maximumRemovals('abcacb', 'ab', [3, 1, 0])
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().maximumRemovals('abcbddddd', 'abcd', [3, 2, 1, 4, 5, 6])
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().maximumRemovals('abcab', 'abc', [0, 1, 2, 3, 4])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
