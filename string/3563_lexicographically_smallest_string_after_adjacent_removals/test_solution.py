import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().lexicographicallySmallestString('abc')
        self.assertEqual(actual, 'a')

    def test_example_2(self):
        actual = Solution().lexicographicallySmallestString('bcda')
        self.assertEqual(actual, '')

    def test_example_3(self):
        actual = Solution().lexicographicallySmallestString('zdce')
        self.assertEqual(actual, 'zdce')


if __name__ == "__main__":
    unittest.main()
