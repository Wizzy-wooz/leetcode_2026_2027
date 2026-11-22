import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().phonePrefix(['1', '2', '4', '3'])
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().phonePrefix(['001', '007', '15', '00153'])
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
