import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestString('cbabc')
        self.assertEqual(actual, 'baabc')

    def test_example_2(self):
        actual = Solution().smallestString('aa')
        self.assertEqual(actual, 'az')

    def test_example_3(self):
        actual = Solution().smallestString('acbbc')
        self.assertEqual(actual, 'abaab')

    def test_example_4(self):
        actual = Solution().smallestString('leetcode')
        self.assertEqual(actual, 'kddsbncd')


if __name__ == "__main__":
    unittest.main()
