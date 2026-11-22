import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().groupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat'])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['bat'], ['nat', 'tan'], ['ate', 'eat', 'tea']]])

    def test_example_2(self):
        actual = Solution().groupAnagrams([''])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['']]])

    def test_example_3(self):
        actual = Solution().groupAnagrams(['a'])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['a']]])


if __name__ == "__main__":
    unittest.main()
