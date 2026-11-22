import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().arrayStringsAreEqual(['ab', 'c'], ['a', 'bc'])
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().arrayStringsAreEqual(['a', 'cb'], ['ab', 'c'])
        self.assertEqual(actual, False)

    def test_example_3(self):
        actual = Solution().arrayStringsAreEqual(['abc', 'd', 'defg'], ['abcddefg'])
        self.assertEqual(actual, True)


if __name__ == "__main__":
    unittest.main()
