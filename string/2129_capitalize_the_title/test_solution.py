import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().capitalizeTitle('capiTalIze tHe titLe')
        self.assertEqual(actual, 'Capitalize The Title')

    def test_example_2(self):
        actual = Solution().capitalizeTitle('First leTTeR of EACH Word')
        self.assertEqual(actual, 'First Letter of Each Word')

    def test_example_3(self):
        actual = Solution().capitalizeTitle('i lOve leetcode')
        self.assertEqual(actual, 'i Love Leetcode')


if __name__ == "__main__":
    unittest.main()
