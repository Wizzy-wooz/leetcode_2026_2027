import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().wordSquares(['able', 'area', 'echo', 'also'])
        self.assertEqual(actual, [['able', 'area', 'echo', 'also'], ['area', 'able', 'also', 'echo']])

    def test_example_2(self):
        actual = Solution().wordSquares(['code', 'cafe', 'eden', 'edge'])
        self.assertEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
