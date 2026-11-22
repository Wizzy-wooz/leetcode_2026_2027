import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maximumXor('101', '011')
        self.assertEqual(actual, '110')

    def test_example_2(self):
        actual = Solution().maximumXor('0110', '1110')
        self.assertEqual(actual, '1101')

    def test_example_3(self):
        actual = Solution().maximumXor('0101', '1001')
        self.assertEqual(actual, '1111')


if __name__ == "__main__":
    unittest.main()
