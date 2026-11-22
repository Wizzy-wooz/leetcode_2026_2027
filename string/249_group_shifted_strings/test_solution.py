import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().groupStrings(['abc', 'bcd', 'acef', 'xyz', 'az', 'ba', 'a', 'z'])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['acef'], ['a', 'z'], ['abc', 'bcd', 'xyz'], ['az', 'ba']]])

    def test_example_2(self):
        actual = Solution().groupStrings(['a'])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['a']]])


if __name__ == "__main__":
    unittest.main()
