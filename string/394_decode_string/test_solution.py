import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().decodeString('3[a]2[bc]')
        self.assertEqual(actual, 'aaabcbc')

    def test_example_2(self):
        actual = Solution().decodeString('3[a2[c]]')
        self.assertEqual(actual, 'accaccacc')

    def test_example_3(self):
        actual = Solution().decodeString('2[abc]3[cd]ef')
        self.assertEqual(actual, 'abcabccdcdcdef')


if __name__ == "__main__":
    unittest.main()
