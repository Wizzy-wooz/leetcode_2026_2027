import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().mostVisitedPattern(['joe', 'joe', 'joe', 'james', 'james', 'james', 'james', 'mary', 'mary', 'mary'], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], ['home', 'about', 'career', 'home', 'cart', 'maps', 'home', 'home', 'about', 'career'])
        self.assertEqual(actual, ['home', 'about', 'career'])

    def test_example_2(self):
        actual = Solution().mostVisitedPattern(['ua', 'ua', 'ua', 'ub', 'ub', 'ub'], [1, 2, 3, 4, 5, 6], ['a', 'b', 'a', 'a', 'b', 'c'])
        self.assertEqual(actual, ['a', 'b', 'a'])


if __name__ == "__main__":
    unittest.main()
