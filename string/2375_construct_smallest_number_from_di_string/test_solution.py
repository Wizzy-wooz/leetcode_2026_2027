import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().smallestNumber('IIIDIDDD')
        self.assertEqual(actual, '123549876')

    def test_example_2(self):
        actual = Solution().smallestNumber('DDD')
        self.assertEqual(actual, '4321')


if __name__ == "__main__":
    unittest.main()
