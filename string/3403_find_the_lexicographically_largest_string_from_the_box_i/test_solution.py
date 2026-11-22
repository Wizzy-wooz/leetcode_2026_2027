import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().answerString('dbca', 2)
        self.assertEqual(actual, 'dbc')

    def test_example_2(self):
        actual = Solution().answerString('gggg', 4)
        self.assertEqual(actual, 'g')


if __name__ == "__main__":
    unittest.main()
