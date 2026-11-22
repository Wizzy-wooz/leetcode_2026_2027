import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().transformStr('101', ['1?1', '0?1', '0?0'])
        self.assertEqual(actual, [True, True, False])

    def test_example_2(self):
        actual = Solution().transformStr('1100', ['0011', '11?1', '1?1?'])
        self.assertEqual(actual, [True, False, True])

    def test_example_3(self):
        actual = Solution().transformStr('1010', ['0011'])
        self.assertEqual(actual, [True])


if __name__ == "__main__":
    unittest.main()
