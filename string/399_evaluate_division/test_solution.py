import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().calcEquation([['a', 'b'], ['b', 'c']], [2.0, 3.0], [['a', 'c'], ['b', 'a'], ['a', 'e'], ['a', 'a'], ['x', 'x']])
        self.assertEqual(actual, [6.0, 0.5, -1.0, 1.0, -1.0])

    def test_example_2(self):
        actual = Solution().calcEquation([['a', 'b'], ['b', 'c'], ['bc', 'cd']], [1.5, 2.5, 5.0], [['a', 'c'], ['c', 'b'], ['bc', 'cd'], ['cd', 'bc']])
        self.assertEqual(actual, [3.75, 0.4, 5.0, 0.2])

    def test_example_3(self):
        actual = Solution().calcEquation([['a', 'b']], [0.5], [['a', 'b'], ['b', 'a'], ['a', 'c'], ['x', 'y']])
        self.assertEqual(actual, [0.5, 2.0, -1.0, -1.0])


if __name__ == "__main__":
    unittest.main()
