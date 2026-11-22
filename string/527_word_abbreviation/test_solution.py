import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().wordsAbbreviation(['like', 'god', 'internal', 'me', 'internet', 'interval', 'intension', 'face', 'intrusion'])
        self.assertEqual(actual, ['l2e', 'god', 'internal', 'me', 'i6t', 'interval', 'inte4n', 'f2e', 'intr4n'])

    def test_example_2(self):
        actual = Solution().wordsAbbreviation(['aa', 'aaa'])
        self.assertEqual(actual, ['aa', 'aaa'])


if __name__ == "__main__":
    unittest.main()
