import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().matchReplacement('fool3e7bar', 'leet', [['e', '3'], ['t', '7'], ['t', '8']])
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().matchReplacement('fooleetbar', 'f00l', [['o', '0']])
        self.assertEqual(actual, False)

    def test_example_3(self):
        actual = Solution().matchReplacement('Fool33tbaR', 'leetd', [['e', '3'], ['t', '7'], ['t', '8'], ['d', 'b'], ['p', 'b']])
        self.assertEqual(actual, True)


if __name__ == "__main__":
    unittest.main()
