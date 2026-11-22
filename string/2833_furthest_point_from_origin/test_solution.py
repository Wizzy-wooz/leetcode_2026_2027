import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().furthestDistanceFromOrigin('L_RL__R')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().furthestDistanceFromOrigin('_R__LL_')
        self.assertEqual(actual, 5)

    def test_example_3(self):
        actual = Solution().furthestDistanceFromOrigin('_______')
        self.assertEqual(actual, 7)


if __name__ == "__main__":
    unittest.main()
