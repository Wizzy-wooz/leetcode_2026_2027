import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().betterCompression('a3c9b2c1')
        self.assertEqual(actual, 'a3b2c10')

    def test_example_2(self):
        actual = Solution().betterCompression('c2b3a1')
        self.assertEqual(actual, 'a1b3c2')

    def test_example_3(self):
        actual = Solution().betterCompression('a2b4c1')
        self.assertEqual(actual, 'a2b4c1')


if __name__ == "__main__":
    unittest.main()
