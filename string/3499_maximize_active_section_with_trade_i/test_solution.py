import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxActiveSectionsAfterTrade('01')
        self.assertEqual(actual, 1)

    def test_example_2(self):
        actual = Solution().maxActiveSectionsAfterTrade('0100')
        self.assertEqual(actual, 4)

    def test_example_3(self):
        actual = Solution().maxActiveSectionsAfterTrade('1000100')
        self.assertEqual(actual, 7)

    def test_example_4(self):
        actual = Solution().maxActiveSectionsAfterTrade('01010')
        self.assertEqual(actual, 4)


if __name__ == "__main__":
    unittest.main()
