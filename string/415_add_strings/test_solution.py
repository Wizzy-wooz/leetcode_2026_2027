import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().addStrings('11', '123')
        self.assertEqual(actual, '134')

    def test_example_2(self):
        actual = Solution().addStrings('456', '77')
        self.assertEqual(actual, '533')

    def test_example_3(self):
        actual = Solution().addStrings('0', '0')
        self.assertEqual(actual, '0')


if __name__ == "__main__":
    unittest.main()
