import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().haveConflict(['01:15', '02:00'], ['02:00', '03:00'])
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().haveConflict(['01:00', '02:00'], ['01:20', '03:00'])
        self.assertEqual(actual, True)

    def test_example_3(self):
        actual = Solution().haveConflict(['10:00', '11:00'], ['14:00', '15:00'])
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
