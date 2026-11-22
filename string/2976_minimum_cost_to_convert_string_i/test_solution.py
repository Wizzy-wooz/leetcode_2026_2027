import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimumCost('abcd', 'acbe', ['a', 'b', 'c', 'c', 'e', 'd'], ['b', 'c', 'b', 'e', 'b', 'e'], [2, 5, 5, 1, 2, 20])
        self.assertEqual(actual, 28)

    def test_example_2(self):
        actual = Solution().minimumCost('aaaa', 'bbbb', ['a', 'c'], ['c', 'b'], [1, 2])
        self.assertEqual(actual, 12)

    def test_example_3(self):
        actual = Solution().minimumCost('abcd', 'abce', ['a'], ['e'], [10000])
        self.assertEqual(actual, -1)


if __name__ == "__main__":
    unittest.main()
