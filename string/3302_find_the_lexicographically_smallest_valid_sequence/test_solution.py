import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().validSequence('vbcca', 'abc')
        self.assertEqual(actual, [0, 1, 2])

    def test_example_2(self):
        actual = Solution().validSequence('bacdc', 'abc')
        self.assertEqual(actual, [1, 2, 4])

    def test_example_3(self):
        actual = Solution().validSequence('aaaaaa', 'aaabc')
        self.assertEqual(actual, [])

    def test_example_4(self):
        actual = Solution().validSequence('abc', 'ab')
        self.assertEqual(actual, [0, 1])


if __name__ == "__main__":
    unittest.main()
