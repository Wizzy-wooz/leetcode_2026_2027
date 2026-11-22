import unittest
from pathlib import Path
from runpy import run_path

WordDictionary = run_path(str(Path(__file__).with_name("solution.py")))['WordDictionary']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = WordDictionary()
        self.assertEqual(obj.addWord('bad'), None)
        self.assertEqual(obj.addWord('dad'), None)
        self.assertEqual(obj.addWord('mad'), None)
        self.assertEqual(obj.search('pad'), False)
        self.assertEqual(obj.search('bad'), True)
        self.assertEqual(obj.search('.ad'), True)
        self.assertEqual(obj.search('b..'), True)


if __name__ == "__main__":
    unittest.main()
