import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findNumOfValidWords(['aaaa', 'asas', 'able', 'ability', 'actt', 'actor', 'access'], ['aboveyz', 'abrodyz', 'abslute', 'absoryz', 'actresz', 'gaswxyz'])
        self.assertEqual(actual, [1, 1, 3, 2, 4, 0])

    def test_example_2(self):
        actual = Solution().findNumOfValidWords(['apple', 'pleas', 'please'], ['aelwxyz', 'aelpxyz', 'aelpsxy', 'saelpxy', 'xaelpsy'])
        self.assertEqual(actual, [0, 1, 3, 2, 0])


if __name__ == "__main__":
    unittest.main()
