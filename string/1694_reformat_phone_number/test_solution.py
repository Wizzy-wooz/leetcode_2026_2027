import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reformatNumber('1-23-45 6')
        self.assertEqual(actual, '123-456')

    def test_example_2(self):
        actual = Solution().reformatNumber('123 4-567')
        self.assertEqual(actual, '123-45-67')

    def test_example_3(self):
        actual = Solution().reformatNumber('123 4-5678')
        self.assertEqual(actual, '123-456-78')


if __name__ == "__main__":
    unittest.main()
