import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().subdomainVisits(['9001 discuss.leetcode.com'])
        self.assertCountEqual(actual, ['9001 leetcode.com', '9001 discuss.leetcode.com', '9001 com'])

    def test_example_2(self):
        actual = Solution().subdomainVisits(['900 google.mail.com', '50 yahoo.com', '1 intel.mail.com', '5 wiki.org'])
        self.assertCountEqual(actual, ['901 mail.com', '50 yahoo.com', '900 google.mail.com', '5 wiki.org', '5 org', '1 intel.mail.com', '951 com'])


if __name__ == "__main__":
    unittest.main()
