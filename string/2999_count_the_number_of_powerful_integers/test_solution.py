import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().numberOfPowerfulInt(1, 6000, 4, '124')
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().numberOfPowerfulInt(15, 215, 6, '10')
        self.assertEqual(actual, 2)

    def test_example_3(self):
        actual = Solution().numberOfPowerfulInt(1000, 2000, 4, '3000')
        self.assertEqual(actual, 0)


if __name__ == "__main__":
    unittest.main()
