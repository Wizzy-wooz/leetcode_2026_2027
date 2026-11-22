import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findSubstring('barfoothefoobarman', ['foo', 'bar'])
        self.assertCountEqual(actual, [0, 9])

    def test_example_2(self):
        actual = Solution().findSubstring('wordgoodgoodgoodbestword', ['word', 'good', 'best', 'word'])
        self.assertCountEqual(actual, [])

    def test_example_3(self):
        actual = Solution().findSubstring('barfoofoobarthefoobarman', ['bar', 'foo', 'the'])
        self.assertCountEqual(actual, [6, 9, 12])


if __name__ == "__main__":
    unittest.main()
