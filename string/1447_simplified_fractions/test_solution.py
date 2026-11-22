import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().simplifiedFractions(2)
        self.assertEqual(actual, ['1/2'])

    def test_example_2(self):
        actual = Solution().simplifiedFractions(3)
        self.assertEqual(actual, ['1/2', '1/3', '2/3'])

    def test_example_3(self):
        actual = Solution().simplifiedFractions(4)
        self.assertEqual(actual, ['1/2', '1/3', '1/4', '2/3', '3/4'])


if __name__ == "__main__":
    unittest.main()
