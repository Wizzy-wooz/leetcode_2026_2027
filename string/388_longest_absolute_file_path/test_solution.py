import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().lengthLongestPath('dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext')
        self.assertEqual(actual, 20)

    def test_example_2(self):
        actual = Solution().lengthLongestPath('dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext')
        self.assertEqual(actual, 32)

    def test_example_3(self):
        actual = Solution().lengthLongestPath('a')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
