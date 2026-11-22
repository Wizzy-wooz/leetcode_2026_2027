import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().toLowerCase('Hello')
        self.assertEqual(actual, 'hello')

    def test_example_2(self):
        actual = Solution().toLowerCase('here')
        self.assertEqual(actual, 'here')

    def test_example_3(self):
        actual = Solution().toLowerCase('LOVELY')
        self.assertEqual(actual, 'lovely')


if __name__ == "__main__":
    unittest.main()
