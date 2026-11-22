import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countPoints('B0B6G0R6R0R6G9')
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().countPoints('B0R0G0R9R0B0G0')
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().countPoints('G4')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
