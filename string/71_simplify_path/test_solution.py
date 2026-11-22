import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().simplifyPath('/home/')
        self.assertEqual(actual, '/home')

    def test_example_2(self):
        actual = Solution().simplifyPath('/home//foo/')
        self.assertEqual(actual, '/home/foo')

    def test_example_3(self):
        actual = Solution().simplifyPath('/home/user/Documents/../Pictures')
        self.assertEqual(actual, '/home/user/Pictures')

    def test_example_4(self):
        actual = Solution().simplifyPath('/../')
        self.assertEqual(actual, '/')

    def test_example_5(self):
        actual = Solution().simplifyPath('/.../a/../b/c/../d/./')
        self.assertEqual(actual, '/.../b/d')


if __name__ == "__main__":
    unittest.main()
