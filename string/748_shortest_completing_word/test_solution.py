import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().shortestCompletingWord('1s3 PSt', ['step', 'steps', 'stripe', 'stepple'])
        self.assertEqual(actual, 'steps')

    def test_example_2(self):
        actual = Solution().shortestCompletingWord('1s3 456', ['looks', 'pest', 'stew', 'show'])
        self.assertEqual(actual, 'pest')


if __name__ == "__main__":
    unittest.main()
