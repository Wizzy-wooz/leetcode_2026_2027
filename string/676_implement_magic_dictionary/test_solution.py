import unittest
from pathlib import Path
from runpy import run_path

MagicDictionary = run_path(str(Path(__file__).with_name("solution.py")))['MagicDictionary']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = MagicDictionary()
        self.assertEqual(obj.buildDict(['hello', 'leetcode']), None)
        self.assertEqual(obj.search('hello'), False)
        self.assertEqual(obj.search('hhllo'), True)
        self.assertEqual(obj.search('hell'), False)
        self.assertEqual(obj.search('leetcoded'), False)


if __name__ == "__main__":
    unittest.main()
