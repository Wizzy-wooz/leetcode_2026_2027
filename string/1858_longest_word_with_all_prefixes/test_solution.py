import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().longestWord(['k', 'ki', 'kir', 'kira', 'kiran'])
        self.assertEqual(actual, 'kiran')

    def test_example_2(self):
        actual = Solution().longestWord(['a', 'banana', 'app', 'appl', 'ap', 'apply', 'apple'])
        self.assertEqual(actual, 'apple')

    def test_example_3(self):
        actual = Solution().longestWord(['abc', 'bc', 'ab', 'qwe'])
        self.assertEqual(actual, '')


if __name__ == "__main__":
    unittest.main()
