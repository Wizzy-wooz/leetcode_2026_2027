import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reorderLogFiles(['dig1 8 1 5 1', 'let1 art can', 'dig2 3 6', 'let2 own kit dig', 'let3 art zero'])
        self.assertEqual(actual, ['let1 art can', 'let3 art zero', 'let2 own kit dig', 'dig1 8 1 5 1', 'dig2 3 6'])

    def test_example_2(self):
        actual = Solution().reorderLogFiles(['a1 9 2 3 1', 'g1 act car', 'zo4 4 7', 'ab1 off key dog', 'a8 act zoo'])
        self.assertEqual(actual, ['g1 act car', 'a8 act zoo', 'ab1 off key dog', 'a1 9 2 3 1', 'zo4 4 7'])


if __name__ == "__main__":
    unittest.main()
