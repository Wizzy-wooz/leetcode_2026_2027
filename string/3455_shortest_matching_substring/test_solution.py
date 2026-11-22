import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestMatchingSubstring('abaacbaecebce', 'ba*c*ce')
        self.assertEqual(actual, 8)

    def test_example_2(self):
        actual = Solution().shortestMatchingSubstring('baccbaadbc', 'cc*baa*adb')
        self.assertEqual(actual, -1)

    def test_example_3(self):
        actual = Solution().shortestMatchingSubstring('a', '**')
        self.assertEqual(actual, 0)

    def test_example_4(self):
        actual = Solution().shortestMatchingSubstring('madlogic', '*adlogi*')
        self.assertEqual(actual, 6)


if __name__ == "__main__":
    unittest.main()
