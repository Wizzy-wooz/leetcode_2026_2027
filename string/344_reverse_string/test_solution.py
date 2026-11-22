import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = ['h', 'e', 'l', 'l', 'o']
        Solution().reverseString(actual)
        self.assertEqual(actual, ['o', 'l', 'l', 'e', 'h'])

    def test_example_2(self):
        actual = ['H', 'a', 'n', 'n', 'a', 'h']
        Solution().reverseString(actual)
        self.assertEqual(actual, ['h', 'a', 'n', 'n', 'a', 'H'])


if __name__ == "__main__":
    unittest.main()
