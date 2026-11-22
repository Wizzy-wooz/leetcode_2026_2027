import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().atMostNGivenDigitSet(['1', '3', '5', '7'], 100)
        self.assertEqual(actual, 20)

    def test_example_2(self):
        actual = Solution().atMostNGivenDigitSet(['1', '4', '9'], 1000000000)
        self.assertEqual(actual, 29523)

    def test_example_3(self):
        actual = Solution().atMostNGivenDigitSet(['7'], 8)
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
