import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().largestWordCount(['Hello userTwooo', 'Hi userThree', 'Wonderful day Alice', 'Nice day userThree'], ['Alice', 'userTwo', 'userThree', 'Alice'])
        self.assertEqual(actual, 'Alice')

    def test_example_2(self):
        actual = Solution().largestWordCount(['How is leetcode for everyone', 'Leetcode is useful for practice'], ['Bob', 'Charlie'])
        self.assertEqual(actual, 'Charlie')


if __name__ == "__main__":
    unittest.main()
