import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generateTheString(4)
        self.assertEqual(actual, 'pppz')

    def test_example_2(self):
        actual = Solution().generateTheString(2)
        self.assertEqual(actual, 'xy')

    def test_example_3(self):
        actual = Solution().generateTheString(7)
        self.assertEqual(actual, 'holasss')


if __name__ == "__main__":
    unittest.main()
