import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maximumValue(['alic3', 'bob', '3', '4', '00000'])
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().maximumValue(['1', '01', '001', '0001'])
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
