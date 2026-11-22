import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().encode('aaa')
        self.assertEqual(actual, 'aaa')

    def test_example_2(self):
        actual = Solution().encode('aaaaa')
        self.assertEqual(actual, '5[a]')

    def test_example_3(self):
        actual = Solution().encode('aaaaaaaaaa')
        self.assertEqual(actual, '10[a]')


if __name__ == "__main__":
    unittest.main()
