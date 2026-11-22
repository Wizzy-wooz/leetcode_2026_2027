import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().vowelStrings(['are', 'amy', 'u'], 0, 2)
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().vowelStrings(['hey', 'aeo', 'mu', 'ooo', 'artro'], 1, 4)
        self.assertEqual(actual, 3)


if __name__ == "__main__":
    unittest.main()
