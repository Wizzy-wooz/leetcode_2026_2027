import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generateString('TFTF', 'ab')
        self.assertEqual(actual, 'ababa')

    def test_example_2(self):
        actual = Solution().generateString('TFTF', 'abc')
        self.assertEqual(actual, '')

    def test_example_3(self):
        actual = Solution().generateString('F', 'd')
        self.assertEqual(actual, 'a')


if __name__ == "__main__":
    unittest.main()
