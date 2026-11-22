import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().letterCasePermutation('a1b2')
        self.assertCountEqual(actual, ['a1b2', 'a1B2', 'A1b2', 'A1B2'])

    def test_example_2(self):
        actual = Solution().letterCasePermutation('3z4')
        self.assertCountEqual(actual, ['3z4', '3Z4'])


if __name__ == "__main__":
    unittest.main()
