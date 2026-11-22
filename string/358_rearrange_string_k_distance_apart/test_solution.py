import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().rearrangeString('aabbcc', 3)
        self.assertEqual(actual, 'abcabc')

    def test_example_2(self):
        actual = Solution().rearrangeString('aaabc', 3)
        self.assertEqual(actual, '')

    def test_example_3(self):
        actual = Solution().rearrangeString('aaadbbcc', 2)
        self.assertEqual(actual, 'abacabcd')


if __name__ == "__main__":
    unittest.main()
