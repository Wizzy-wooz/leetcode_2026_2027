import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countTime('?5:00')
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().countTime('0?:0?')
        self.assertEqual(actual, 100)

    def test_example_3(self):
        actual = Solution().countTime('??:??')
        self.assertEqual(actual, 1440)


if __name__ == "__main__":
    unittest.main()
