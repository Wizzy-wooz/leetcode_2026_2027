import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minCostGoodCaption('cdcd')
        self.assertEqual(actual, 'cccc')

    def test_example_2(self):
        actual = Solution().minCostGoodCaption('aca')
        self.assertEqual(actual, 'aaa')

    def test_example_3(self):
        actual = Solution().minCostGoodCaption('bc')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
