import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().originalDigits('owoztneoer')
        self.assertEqual(actual, '012')

    def test_example_2(self):
        actual = Solution().originalDigits('fviefuro')
        self.assertEqual(actual, '45')


if __name__ == "__main__":
    unittest.main()
