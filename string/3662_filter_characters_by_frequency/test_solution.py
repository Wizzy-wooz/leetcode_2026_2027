import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().filterCharacters('aadbbcccca', 3)
        self.assertEqual(actual, 'dbb')

    def test_example_2(self):
        actual = Solution().filterCharacters('xyz', 2)
        self.assertEqual(actual, 'xyz')


if __name__ == "__main__":
    unittest.main()
