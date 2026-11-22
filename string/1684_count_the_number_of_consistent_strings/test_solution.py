import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countConsistentStrings('ab', ['ad', 'bd', 'aaab', 'baa', 'badab'])
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().countConsistentStrings('abc', ['a', 'b', 'c', 'ab', 'ac', 'bc', 'abc'])
        self.assertEqual(actual, 7)

    def test_example_3(self):
        actual = Solution().countConsistentStrings('cad', ['cc', 'acd', 'b', 'ba', 'bac', 'bad', 'ac', 'd'])
        self.assertEqual(actual, 4)


if __name__ == "__main__":
    unittest.main()
