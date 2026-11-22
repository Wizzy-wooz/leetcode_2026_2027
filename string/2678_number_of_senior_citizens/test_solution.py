import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countSeniors(['7868190130M7522', '5303914400F9211', '9273338290F4010'])
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().countSeniors(['1313579440F2036', '2921522980M5644'])
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
