import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findLadders('hit', 'cog', ['hot', 'dot', 'dog', 'lot', 'log', 'cog'])
        self.assertCountEqual(actual, [['hit', 'hot', 'dot', 'dog', 'cog'], ['hit', 'hot', 'lot', 'log', 'cog']])

    def test_example_2(self):
        actual = Solution().findLadders('hit', 'cog', ['hot', 'dot', 'dog', 'lot', 'log'])
        self.assertCountEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
