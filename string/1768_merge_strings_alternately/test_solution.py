import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().mergeAlternately('abc', 'pqr')
        self.assertEqual(actual, 'apbqcr')

    def test_example_2(self):
        actual = Solution().mergeAlternately('ab', 'pqrs')
        self.assertEqual(actual, 'apbqrs')

    def test_example_3(self):
        actual = Solution().mergeAlternately('abcd', 'pq')
        self.assertEqual(actual, 'apbqcd')


if __name__ == "__main__":
    unittest.main()
