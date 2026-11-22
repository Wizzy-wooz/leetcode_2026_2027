import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().addSpaces('LeetcodeHelpsMeLearn', [8, 13, 15])
        self.assertEqual(actual, 'Leetcode Helps Me Learn')

    def test_example_2(self):
        actual = Solution().addSpaces('icodeinpython', [1, 5, 7, 9])
        self.assertEqual(actual, 'i code in py thon')

    def test_example_3(self):
        actual = Solution().addSpaces('spacing', [0, 1, 2, 3, 4, 5, 6])
        self.assertEqual(actual, ' s p a c i n g')


if __name__ == "__main__":
    unittest.main()
