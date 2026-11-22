import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().beautySum('aabcb')
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().beautySum('aabcbaa')
        self.assertEqual(actual, 17)


if __name__ == "__main__":
    unittest.main()
