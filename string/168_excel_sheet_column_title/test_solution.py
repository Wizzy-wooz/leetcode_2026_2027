import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().convertToTitle(1)
        self.assertEqual(actual, 'A')

    def test_example_2(self):
        actual = Solution().convertToTitle(28)
        self.assertEqual(actual, 'AB')

    def test_example_3(self):
        actual = Solution().convertToTitle(701)
        self.assertEqual(actual, 'ZY')


if __name__ == "__main__":
    unittest.main()
