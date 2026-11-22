import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().repeatedCharacter('abccbaacz')
        self.assertEqual(actual, 'c')

    def test_example_2(self):
        actual = Solution().repeatedCharacter('abcdd')
        self.assertEqual(actual, 'd')


if __name__ == "__main__":
    unittest.main()
