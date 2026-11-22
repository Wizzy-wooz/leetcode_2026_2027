import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sumAndMultiply('10203004', [[0, 7], [1, 3], [4, 6]])
        self.assertEqual(actual, [12340, 4, 9])

    def test_example_2(self):
        actual = Solution().sumAndMultiply('1000', [[0, 3], [1, 1]])
        self.assertEqual(actual, [1, 0])

    def test_example_3(self):
        actual = Solution().sumAndMultiply('9876543210', [[0, 9]])
        self.assertEqual(actual, [444444137])


if __name__ == "__main__":
    unittest.main()
