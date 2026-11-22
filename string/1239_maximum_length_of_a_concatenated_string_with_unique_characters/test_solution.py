import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().maxLength(['un', 'iq', 'ue'])
        self.assertEqual(actual, 4)

    def test_example_2(self):
        actual = Solution().maxLength(['cha', 'r', 'act', 'ers'])
        self.assertEqual(actual, 6)

    def test_example_3(self):
        actual = Solution().maxLength(['abcdefghijklmnopqrstuvwxyz'])
        self.assertEqual(actual, 26)


if __name__ == "__main__":
    unittest.main()
