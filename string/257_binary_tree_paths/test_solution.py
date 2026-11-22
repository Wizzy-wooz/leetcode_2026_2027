import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example(self):
        TreeNode = run_path(str(Path(__file__).with_name('solution.py')))['TreeNode']
        actual = Solution().binaryTreePaths(TreeNode(2))
        self.assertEqual(actual, ['2'])


if __name__ == "__main__":
    unittest.main()
