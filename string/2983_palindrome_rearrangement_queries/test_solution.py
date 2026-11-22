import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().canMakePalindromeQueries('abcabc', [[1, 1, 3, 5], [0, 2, 5, 5]])
        self.assertEqual(actual, [True, True])

    def test_example_2(self):
        actual = Solution().canMakePalindromeQueries('abbcdecbba', [[0, 2, 7, 9]])
        self.assertEqual(actual, [False])

    def test_example_3(self):
        actual = Solution().canMakePalindromeQueries('acbcab', [[1, 2, 4, 5]])
        self.assertEqual(actual, [True])


if __name__ == "__main__":
    unittest.main()
