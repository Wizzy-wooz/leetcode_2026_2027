import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minCost('hello', 'world', [['he', 'wo'], ['llo', 'rld']], [3, 4])
        self.assertEqual(actual, 7)

    def test_example_2(self):
        actual = Solution().minCost('cat', 'dog', [['c*t', 'dog']], [2])
        self.assertEqual(actual, 3)

    def test_example_3(self):
        actual = Solution().minCost('test', 'next', [['*e*t', 'next']], [4])
        self.assertEqual(actual, 6)

    def test_example_4(self):
        actual = Solution().minCost('ab', 'bc', [['a*', 'bd']], [9])
        self.assertEqual(actual, -1)


if __name__ == "__main__":
    unittest.main()
