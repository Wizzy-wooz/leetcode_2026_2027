import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().trafficSignal(60)
        self.assertEqual(actual, 'Red')

    def test_example_2(self):
        actual = Solution().trafficSignal(5)
        self.assertEqual(actual, 'Invalid')


if __name__ == "__main__":
    unittest.main()
