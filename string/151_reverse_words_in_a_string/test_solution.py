import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reverseWords('the sky is blue')
        self.assertEqual(actual, 'blue is sky the')

    def test_example_2(self):
        actual = Solution().reverseWords('  hello world  ')
        self.assertEqual(actual, 'world hello')

    def test_example_3(self):
        actual = Solution().reverseWords('a good   example')
        self.assertEqual(actual, 'example good a')


if __name__ == "__main__":
    unittest.main()
