import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reversePrefix('abcd', 2)
        self.assertEqual(actual, 'bacd')

    def test_example_2(self):
        actual = Solution().reversePrefix('xyz', 3)
        self.assertEqual(actual, 'zyx')

    def test_example_3(self):
        actual = Solution().reversePrefix('hey', 1)
        self.assertEqual(actual, 'hey')


if __name__ == "__main__":
    unittest.main()
