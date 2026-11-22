import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().compressedString('abcde')
        self.assertEqual(actual, '1a1b1c1d1e')

    def test_example_2(self):
        actual = Solution().compressedString('aaaaaaaaaaaaaabb')
        self.assertEqual(actual, '9a5a2b')


if __name__ == "__main__":
    unittest.main()
