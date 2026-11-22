import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().gcdOfStrings('ABCABC', 'ABC')
        self.assertEqual(actual, 'ABC')

    def test_example_2(self):
        actual = Solution().gcdOfStrings('ABABAB', 'ABAB')
        self.assertEqual(actual, 'AB')

    def test_example_3(self):
        actual = Solution().gcdOfStrings('LEET', 'CODE')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
