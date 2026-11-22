import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findAnswer([-1, 0, 0, 1, 1, 2], 'aababa')
        self.assertEqual(actual, [True, True, False, True, True, True])

    def test_example_2(self):
        actual = Solution().findAnswer([-1, 0, 0, 0, 0], 'aabcb')
        self.assertEqual(actual, [True, True, True, True, True])


if __name__ == "__main__":
    unittest.main()
