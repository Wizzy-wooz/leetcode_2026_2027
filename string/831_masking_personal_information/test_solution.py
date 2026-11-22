import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maskPII('LeetCode@LeetCode.com')
        self.assertEqual(actual, 'l*****e@leetcode.com')

    def test_example_2(self):
        actual = Solution().maskPII('AB@qq.com')
        self.assertEqual(actual, 'a*****b@qq.com')

    def test_example_3(self):
        actual = Solution().maskPII('1(234)567-890')
        self.assertEqual(actual, '***-***-7890')


if __name__ == "__main__":
    unittest.main()
