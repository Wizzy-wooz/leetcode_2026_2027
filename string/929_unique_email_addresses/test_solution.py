import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numUniqueEmails(['test.email+alex@leetcode.com', 'test.e.mail+bob.cathy@leetcode.com', 'testemail+david@lee.tcode.com'])
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().numUniqueEmails(['a@leetcode.com', 'b@leetcode.com', 'c@leetcode.com'])
        self.assertEqual(actual, 3)


if __name__ == "__main__":
    unittest.main()
