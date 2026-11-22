import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generatePossibleNextMoves('++++')
        self.assertEqual(actual, ['--++', '+--+', '++--'])

    def test_example_2(self):
        actual = Solution().generatePossibleNextMoves('+')
        self.assertEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
