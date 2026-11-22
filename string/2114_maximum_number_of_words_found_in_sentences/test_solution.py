import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().mostWordsFound(['alice and bob love leetcode', 'i think so too', 'this is great thanks very much'])
        self.assertEqual(actual, 6)

    def test_example_2(self):
        actual = Solution().mostWordsFound(['please wait', 'continue to fight', 'continue to win'])
        self.assertEqual(actual, 3)


if __name__ == "__main__":
    unittest.main()
