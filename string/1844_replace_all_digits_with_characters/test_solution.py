import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().replaceDigits('a1c1e1')
        self.assertEqual(actual, 'abcdef')

    def test_example_2(self):
        actual = Solution().replaceDigits('a1b2c3d4e')
        self.assertEqual(actual, 'abbdcfdhe')


if __name__ == "__main__":
    unittest.main()
