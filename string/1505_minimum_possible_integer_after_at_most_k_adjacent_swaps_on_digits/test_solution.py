import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minInteger('4321', 4)
        self.assertEqual(actual, '1342')

    def test_example_2(self):
        actual = Solution().minInteger('100', 1)
        self.assertEqual(actual, '010')

    def test_example_3(self):
        actual = Solution().minInteger('36789', 1000)
        self.assertEqual(actual, '36789')


if __name__ == "__main__":
    unittest.main()
