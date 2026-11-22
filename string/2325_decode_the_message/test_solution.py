import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().decodeMessage('the quick brown fox jumps over the lazy dog', 'vkbs bs t suepuv')
        self.assertEqual(actual, 'this is a secret')

    def test_example_2(self):
        actual = Solution().decodeMessage('eljuxhpwnyrdgtqkviszcfmabo', 'zwx hnfx lqantp mnoeius ycgk vcnjrdb')
        self.assertEqual(actual, 'the five boxing wizards jump quickly')


if __name__ == "__main__":
    unittest.main()
