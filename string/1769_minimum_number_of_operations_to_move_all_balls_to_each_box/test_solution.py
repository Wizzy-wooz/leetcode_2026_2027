import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minOperations('110')
        self.assertEqual(actual, [1, 1, 3])

    def test_example_2(self):
        actual = Solution().minOperations('001011')
        self.assertEqual(actual, [11, 8, 5, 4, 3, 4])


if __name__ == "__main__":
    unittest.main()
