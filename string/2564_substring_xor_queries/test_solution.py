import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().substringXorQueries('101101', [[0, 5], [1, 2]])
        self.assertEqual(actual, [[0, 2], [2, 3]])

    def test_example_2(self):
        actual = Solution().substringXorQueries('0101', [[12, 8]])
        self.assertEqual(actual, [[-1, -1]])

    def test_example_3(self):
        actual = Solution().substringXorQueries('1', [[4, 5]])
        self.assertEqual(actual, [[0, 0]])


if __name__ == "__main__":
    unittest.main()
