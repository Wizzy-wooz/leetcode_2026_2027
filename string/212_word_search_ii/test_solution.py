import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findWords([['o', 'a', 'a', 'n'], ['e', 't', 'a', 'e'], ['i', 'h', 'k', 'r'], ['i', 'f', 'l', 'v']], ['oath', 'pea', 'eat', 'rain'])
        self.assertCountEqual(actual, ['eat', 'oath'])

    def test_example_2(self):
        actual = Solution().findWords([['a', 'b'], ['c', 'd']], ['abcb'])
        self.assertCountEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
