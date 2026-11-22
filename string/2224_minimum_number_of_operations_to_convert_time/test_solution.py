import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().convertTime('02:30', '04:35')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().convertTime('11:00', '11:01')
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
