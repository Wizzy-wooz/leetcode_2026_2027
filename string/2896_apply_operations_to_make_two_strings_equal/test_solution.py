import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minOperations('1100011000', '0101001010', 2)
        self.assertEqual(actual, 4)

    def test_example_2(self):
        actual = Solution().minOperations('10110', '00011', 4)
        self.assertEqual(actual, -1)


if __name__ == "__main__":
    unittest.main()
