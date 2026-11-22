import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().similarRGB('#09f166')
        self.assertEqual(actual, '#11ee66')

    def test_example_2(self):
        actual = Solution().similarRGB('#4e3fe1')
        self.assertEqual(actual, '#5544dd')


if __name__ == "__main__":
    unittest.main()
