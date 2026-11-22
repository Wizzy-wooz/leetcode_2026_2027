import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minimizedStringLength('aaabc')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().minimizedStringLength('cbbd')
        self.assertEqual(actual, 3)

    def test_example_3(self):
        actual = Solution().minimizedStringLength('baadccab')
        self.assertEqual(actual, 4)


if __name__ == "__main__":
    unittest.main()
