import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findPattern([[1, 2, 2], [2, 2, 3], [2, 3, 3]], ['ab', 'bb'])
        self.assertEqual(actual, [0, 0])

    def test_example_2(self):
        actual = Solution().findPattern([[1, 1, 2], [3, 3, 4], [6, 6, 6]], ['ab', '66'])
        self.assertEqual(actual, [1, 1])

    def test_example_3(self):
        actual = Solution().findPattern([[1, 2], [2, 1]], ['xx'])
        self.assertEqual(actual, [-1, -1])


if __name__ == "__main__":
    unittest.main()
