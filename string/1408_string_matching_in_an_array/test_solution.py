import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().stringMatching(['mass', 'as', 'hero', 'superhero'])
        self.assertEqual(actual, ['as', 'hero'])

    def test_example_2(self):
        actual = Solution().stringMatching(['leetcode', 'et', 'code'])
        self.assertEqual(actual, ['et', 'code'])

    def test_example_3(self):
        actual = Solution().stringMatching(['blue', 'green', 'bu'])
        self.assertEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
