import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().scoreOfStudents('7+3*1*2', [20, 13, 42])
        self.assertEqual(actual, 7)

    def test_example_2(self):
        actual = Solution().scoreOfStudents('3+5*2', [13, 0, 10, 13, 13, 16, 16])
        self.assertEqual(actual, 19)

    def test_example_3(self):
        actual = Solution().scoreOfStudents('6+0*1', [12, 9, 6, 4, 8, 6])
        self.assertEqual(actual, 10)


if __name__ == "__main__":
    unittest.main()
