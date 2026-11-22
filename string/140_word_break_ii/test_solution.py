import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().wordBreak('catsanddog', ['cat', 'cats', 'and', 'sand', 'dog'])
        self.assertCountEqual(actual, ['cats and dog', 'cat sand dog'])

    def test_example_2(self):
        actual = Solution().wordBreak('pineapplepenapple', ['apple', 'pen', 'applepen', 'pine', 'pineapple'])
        self.assertCountEqual(actual, ['pine apple pen apple', 'pineapple pen apple', 'pine applepen apple'])

    def test_example_3(self):
        actual = Solution().wordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])
        self.assertCountEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
