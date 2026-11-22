import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = ['t', 'h', 'e', ' ', 's', 'k', 'y', ' ', 'i', 's', ' ', 'b', 'l', 'u', 'e']
        Solution().reverseWords(actual)
        self.assertEqual(actual, ['b', 'l', 'u', 'e', ' ', 'i', 's', ' ', 's', 'k', 'y', ' ', 't', 'h', 'e'])

    def test_example_2(self):
        actual = ['a']
        Solution().reverseWords(actual)
        self.assertEqual(actual, ['a'])


if __name__ == "__main__":
    unittest.main()
