import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findWordsContaining(['leet', 'code'], 'e')
        self.assertEqual(actual, [0, 1])

    def test_example_2(self):
        actual = Solution().findWordsContaining(['abc', 'bcd', 'aaaa', 'cbc'], 'a')
        self.assertEqual(actual, [0, 2])

    def test_example_3(self):
        actual = Solution().findWordsContaining(['abc', 'bcd', 'aaaa', 'cbc'], 'z')
        self.assertEqual(actual, [])


if __name__ == "__main__":
    unittest.main()
