import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reverseParentheses('(abcd)')
        self.assertEqual(actual, 'dcba')

    def test_example_2(self):
        actual = Solution().reverseParentheses('(u(love)i)')
        self.assertEqual(actual, 'iloveu')

    def test_example_3(self):
        actual = Solution().reverseParentheses('(ed(et(oc))el)')
        self.assertEqual(actual, 'leetcode')


if __name__ == "__main__":
    unittest.main()
