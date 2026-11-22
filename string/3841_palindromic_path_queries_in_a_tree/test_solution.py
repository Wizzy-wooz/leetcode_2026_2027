import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().palindromePath(3, [[0, 1], [1, 2]], 'aac', ['query 0 2', 'update 1 b', 'query 0 2'])
        self.assertEqual(actual, [True, False])

    def test_example_2(self):
        actual = Solution().palindromePath(4, [[0, 1], [0, 2], [0, 3]], 'abca', ['query 1 2', 'update 0 b', 'query 2 3', 'update 3 a', 'query 1 3'])
        self.assertEqual(actual, [False, False, True])


if __name__ == "__main__":
    unittest.main()
