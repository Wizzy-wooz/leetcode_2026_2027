import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().stringSequence('abc')
        self.assertEqual(actual, ['a', 'aa', 'ab', 'aba', 'abb', 'abc'])

    def test_example_2(self):
        actual = Solution().stringSequence('he')
        self.assertEqual(actual, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'ha', 'hb', 'hc', 'hd', 'he'])


if __name__ == "__main__":
    unittest.main()
