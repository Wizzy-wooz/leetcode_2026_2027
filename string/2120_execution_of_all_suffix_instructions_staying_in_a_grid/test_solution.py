import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().executeInstructions(3, [0, 1], 'RRDDLU')
        self.assertEqual(actual, [1, 5, 4, 3, 1, 0])

    def test_example_2(self):
        actual = Solution().executeInstructions(2, [1, 1], 'LURD')
        self.assertEqual(actual, [4, 1, 0, 0])

    def test_example_3(self):
        actual = Solution().executeInstructions(1, [0, 0], 'LRUD')
        self.assertEqual(actual, [0, 0, 0, 0])


if __name__ == "__main__":
    unittest.main()
