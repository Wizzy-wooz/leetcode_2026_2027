import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numberOfSubstrings('00011')
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().numberOfSubstrings('101101')
        self.assertEqual(actual, 16)


if __name__ == "__main__":
    unittest.main()
