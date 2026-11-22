import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numberOfRounds('09:31', '10:14')
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().numberOfRounds('21:30', '03:00')
        self.assertEqual(actual, 22)


if __name__ == "__main__":
    unittest.main()
