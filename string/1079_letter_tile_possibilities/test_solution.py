import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numTilePossibilities('AAB')
        self.assertEqual(actual, 8)

    def test_example_2(self):
        actual = Solution().numTilePossibilities('AAABBC')
        self.assertEqual(actual, 188)

    def test_example_3(self):
        actual = Solution().numTilePossibilities('V')
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
