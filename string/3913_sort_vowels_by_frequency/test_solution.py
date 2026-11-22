import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sortVowels('leetcode')
        self.assertEqual(actual, 'leetcedo')

    def test_example_2(self):
        actual = Solution().sortVowels('aeiaaioooa')
        self.assertEqual(actual, 'aaaaoooiie')

    def test_example_3(self):
        actual = Solution().sortVowels('baeiou')
        self.assertEqual(actual, 'baeiou')


if __name__ == "__main__":
    unittest.main()
