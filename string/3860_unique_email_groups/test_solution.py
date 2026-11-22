import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().uniqueEmailGroups(['test.email+alex@leetcode.com', 'test.e.mail+bob.cathy@leetcode.com', 'testemail+david@lee.tcode.com'])
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().uniqueEmailGroups(['A@B.com', 'a@b.com', 'ab+xy@b.com', 'a.b@b.com'])
        self.assertEqual(actual, 2)

    def test_example_3(self):
        actual = Solution().uniqueEmailGroups(['a.b+c.d+e@DoMain.com', 'ab+xyz@domain.com', 'ab@domain.com'])
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
