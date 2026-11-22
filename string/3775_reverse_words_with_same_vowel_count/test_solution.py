import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reverseWords('cat and mice')
        self.assertEqual(actual, 'cat dna mice')

    def test_example_2(self):
        actual = Solution().reverseWords('book is nice')
        self.assertEqual(actual, 'book is ecin')

    def test_example_3(self):
        actual = Solution().reverseWords('banana healthy')
        self.assertEqual(actual, 'banana healthy')


if __name__ == "__main__":
    unittest.main()
