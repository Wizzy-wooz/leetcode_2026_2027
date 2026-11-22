import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().compress(['a', 'a', 'b', 'b', 'c', 'c', 'c'])
        self.assertEqual(actual, 6)

    def test_example_2(self):
        actual = Solution().compress(['a'])
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().compress(['a', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'])
        self.assertEqual(actual, 4)


if __name__ == "__main__":
    unittest.main()
