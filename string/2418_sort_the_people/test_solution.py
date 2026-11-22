import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sortPeople(['Mary', 'John', 'Emma'], [180, 165, 170])
        self.assertEqual(actual, ['Mary', 'Emma', 'John'])

    def test_example_2(self):
        actual = Solution().sortPeople(['Alice', 'Bob', 'Bob'], [155, 185, 150])
        self.assertEqual(actual, ['Bob', 'Alice', 'Bob'])


if __name__ == "__main__":
    unittest.main()
