import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().calculateScore(['jump', 'add', 'add', 'jump', 'add', 'jump'], [2, 1, 3, 1, -2, -3])
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().calculateScore(['jump', 'add', 'add'], [3, 1, 1])
        self.assertEqual(actual, 0)

    def test_example_3(self):
        actual = Solution().calculateScore(['jump'], [0])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
