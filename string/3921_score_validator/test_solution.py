import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().scoreValidator(['1', '4', 'W', '6', 'WD'])
        self.assertEqual(actual, [12, 1])

    def test_example_2(self):
        actual = Solution().scoreValidator(['WD', 'NB', '0', '4', '4'])
        self.assertEqual(actual, [10, 0])

    def test_example_3(self):
        actual = Solution().scoreValidator(['W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W', 'W'])
        self.assertEqual(actual, [0, 10])


if __name__ == "__main__":
    unittest.main()
