import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().openLock(['0201', '0101', '0102', '1212', '2002'], '0202')
        self.assertEqual(actual, 6)

    def test_example_2(self):
        actual = Solution().openLock(['8888'], '0009')
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().openLock(['8887', '8889', '8878', '8898', '8788', '8988', '7888', '9888'], '8888')
        self.assertEqual(actual, -1)


if __name__ == "__main__":
    unittest.main()
