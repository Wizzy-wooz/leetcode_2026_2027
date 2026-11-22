import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minFlips('1010')
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().minFlips('0110')
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().minFlips('1000')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
