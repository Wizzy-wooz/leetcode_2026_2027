import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minRemoveToMakeValid('lee(t(c)o)de)')
        self.assertEqual(actual, 'lee(t(c)o)de')

    def test_example_2(self):
        actual = Solution().minRemoveToMakeValid('a)b(c)d')
        self.assertEqual(actual, 'ab(c)d')

    def test_example_3(self):
        actual = Solution().minRemoveToMakeValid('))((')
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
