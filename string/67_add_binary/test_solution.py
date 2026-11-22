import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().addBinary('11', '1')
        self.assertEqual(actual, '100')

    def test_example_2(self):
        actual = Solution().addBinary('1010', '1011')
        self.assertEqual(actual, '10101')


if __name__ == "__main__":
    unittest.main()
