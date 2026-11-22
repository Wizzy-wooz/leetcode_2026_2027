import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxScoreWords(['dog', 'cat', 'dad', 'good'], ['a', 'a', 'c', 'd', 'd', 'd', 'g', 'o', 'o'], [1, 0, 9, 5, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        self.assertEqual(actual, 23)

    def test_example_2(self):
        actual = Solution().maxScoreWords(['xxxz', 'ax', 'bx', 'cx'], ['z', 'a', 'b', 'c', 'x', 'x', 'x'], [4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 10])
        self.assertEqual(actual, 27)

    def test_example_3(self):
        actual = Solution().maxScoreWords(['leetcode'], ['l', 'e', 't', 'c', 'o', 'd'], [0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
