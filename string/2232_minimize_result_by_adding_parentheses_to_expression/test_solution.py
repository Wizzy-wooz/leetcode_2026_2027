import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimizeResult('247+38')
        self.assertEqual(actual, '2(47+38)')

    def test_example_2(self):
        actual = Solution().minimizeResult('12+34')
        self.assertEqual(actual, '1(2+3)4')

    def test_example_3(self):
        actual = Solution().minimizeResult('999+999')
        self.assertEqual(actual, '(999+999)')


if __name__ == "__main__":
    unittest.main()
