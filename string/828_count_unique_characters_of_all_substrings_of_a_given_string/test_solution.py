import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().uniqueLetterString('ABC')
        self.assertEqual(actual, 10)

    def test_example_2(self):
        actual = Solution().uniqueLetterString('ABA')
        self.assertEqual(actual, 8)

    def test_example_3(self):
        actual = Solution().uniqueLetterString('LEETCODE')
        self.assertEqual(actual, 92)


if __name__ == "__main__":
    unittest.main()
