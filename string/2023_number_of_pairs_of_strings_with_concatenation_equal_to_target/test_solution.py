import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numOfPairs(['777', '7', '77', '77'], '7777')
        self.assertEqual(actual, 4)

    def test_example_2(self):
        actual = Solution().numOfPairs(['123', '4', '12', '34'], '1234')
        self.assertEqual(actual, 2)

    def test_example_3(self):
        actual = Solution().numOfPairs(['1', '1', '1'], '11')
        self.assertEqual(actual, 6)


if __name__ == "__main__":
    unittest.main()
