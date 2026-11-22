import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxProduct(['abcw', 'baz', 'foo', 'bar', 'xtfn', 'abcdef'])
        self.assertEqual(actual, 16)

    def test_example_2(self):
        actual = Solution().maxProduct(['a', 'ab', 'abc', 'd', 'cd', 'bcd', 'abcd'])
        self.assertEqual(actual, 4)

    def test_example_3(self):
        actual = Solution().maxProduct(['a', 'aa', 'aaa', 'aaaa'])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
