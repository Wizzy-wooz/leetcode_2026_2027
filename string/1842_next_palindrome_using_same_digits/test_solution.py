import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().nextPalindrome('1221')
        self.assertEqual(actual, '2112')

    def test_example_2(self):
        actual = Solution().nextPalindrome('32123')
        self.assertEqual(actual, '')

    def test_example_3(self):
        actual = Solution().nextPalindrome('45544554')
        self.assertEqual(actual, '54455445')


if __name__ == "__main__":
    unittest.main()
