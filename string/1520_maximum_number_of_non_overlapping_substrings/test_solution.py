import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxNumOfSubstrings('adefaddaccc')
        self.assertEqual(actual, ['e', 'f', 'ccc'])

    def test_example_2(self):
        actual = Solution().maxNumOfSubstrings('abbaccd')
        self.assertEqual(actual, ['d', 'bb', 'cc'])


if __name__ == "__main__":
    unittest.main()
