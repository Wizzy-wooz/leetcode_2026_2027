import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().vowelStrings(['aba', 'bcb', 'ece', 'aa', 'e'], [[0, 2], [1, 4], [1, 1]])
        self.assertEqual(actual, [2, 3, 0])

    def test_example_2(self):
        actual = Solution().vowelStrings(['a', 'e', 'i'], [[0, 2], [0, 1], [2, 2]])
        self.assertEqual(actual, [3, 2, 1])


if __name__ == "__main__":
    unittest.main()
