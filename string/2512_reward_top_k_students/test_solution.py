import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().topStudents(['smart', 'brilliant', 'studious'], ['not'], ['this student is studious', 'the student is smart'], [1, 2], 2)
        self.assertEqual(actual, [1, 2])

    def test_example_2(self):
        actual = Solution().topStudents(['smart', 'brilliant', 'studious'], ['not'], ['this student is not studious', 'the student is smart'], [1, 2], 2)
        self.assertEqual(actual, [2, 1])


if __name__ == "__main__":
    unittest.main()
