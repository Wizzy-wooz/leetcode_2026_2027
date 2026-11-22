import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().arrangeWords('Leetcode is cool')
        self.assertEqual(actual, 'Is cool leetcode')

    def test_example_2(self):
        actual = Solution().arrangeWords('Keep calm and code on')
        self.assertEqual(actual, 'On and keep calm code')

    def test_example_3(self):
        actual = Solution().arrangeWords('To be or not to be')
        self.assertEqual(actual, 'To be or to be not')


if __name__ == "__main__":
    unittest.main()
