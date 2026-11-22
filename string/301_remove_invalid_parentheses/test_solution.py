import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeInvalidParentheses('()())()')
        self.assertCountEqual(actual, ['(())()', '()()()'])

    def test_example_2(self):
        actual = Solution().removeInvalidParentheses('(a)())()')
        self.assertCountEqual(actual, ['(a())()', '(a)()()'])

    def test_example_3(self):
        actual = Solution().removeInvalidParentheses(')(')
        self.assertCountEqual(actual, [''])


if __name__ == "__main__":
    unittest.main()
