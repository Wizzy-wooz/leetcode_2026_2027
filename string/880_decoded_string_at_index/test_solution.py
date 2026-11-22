import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().decodeAtIndex('leet2code3', 10)
        self.assertEqual(actual, 'o')

    def test_example_2(self):
        actual = Solution().decodeAtIndex('ha22', 5)
        self.assertEqual(actual, 'h')

    def test_example_3(self):
        actual = Solution().decodeAtIndex('a2345678999999999999999', 1)
        self.assertEqual(actual, 'a')


if __name__ == "__main__":
    unittest.main()
