import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimumPushes('abcde')
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().minimumPushes('xyzxyzxyzxyz')
        self.assertEqual(actual, 12)

    def test_example_3(self):
        actual = Solution().minimumPushes('aabbccddeeffgghhiiiiii')
        self.assertEqual(actual, 24)


if __name__ == "__main__":
    unittest.main()
