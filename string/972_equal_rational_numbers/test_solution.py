import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().isRationalEqual('0.(52)', '0.5(25)')
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().isRationalEqual('0.1666(6)', '0.166(66)')
        self.assertEqual(actual, True)

    def test_example_3(self):
        actual = Solution().isRationalEqual('0.9(9)', '1.')
        self.assertEqual(actual, True)


if __name__ == "__main__":
    unittest.main()
