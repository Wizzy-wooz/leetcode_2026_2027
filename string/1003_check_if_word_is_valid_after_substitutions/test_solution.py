import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().isValid('aabcbc')
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().isValid('abcabcababcc')
        self.assertEqual(actual, True)

    def test_example_3(self):
        actual = Solution().isValid('abccba')
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
