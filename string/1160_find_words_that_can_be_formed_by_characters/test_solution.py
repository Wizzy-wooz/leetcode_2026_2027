import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countCharacters(['cat', 'bt', 'hat', 'tree'], 'atach')
        self.assertEqual(actual, 6)

    def test_example_2(self):
        actual = Solution().countCharacters(['hello', 'world', 'leetcode'], 'welldonehoneyr')
        self.assertEqual(actual, 10)


if __name__ == "__main__":
    unittest.main()
