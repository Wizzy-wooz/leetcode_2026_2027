import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().boldWords(['ab', 'bc'], 'aabcd')
        self.assertEqual(actual, 'a<b>abc</b>d')

    def test_example_2(self):
        actual = Solution().boldWords(['ab', 'cb'], 'aabcd')
        self.assertEqual(actual, 'a<b>ab</b>cd')


if __name__ == "__main__":
    unittest.main()
