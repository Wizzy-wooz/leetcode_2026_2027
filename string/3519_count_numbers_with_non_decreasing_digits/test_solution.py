import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countNumbers('23', '28', 8)
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().countNumbers('2', '7', 2)
        self.assertEqual(actual, 2)


if __name__ == "__main__":
    unittest.main()
