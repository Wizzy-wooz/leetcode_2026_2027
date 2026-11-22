import unittest
from pathlib import Path
from runpy import run_path

Trie = run_path(str(Path(__file__).with_name("solution.py")))['Trie']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = Trie()
        self.assertEqual(obj.insert('apple'), None)
        self.assertEqual(obj.search('apple'), True)
        self.assertEqual(obj.search('app'), False)
        self.assertEqual(obj.startsWith('app'), True)
        self.assertEqual(obj.insert('app'), None)
        self.assertEqual(obj.search('app'), True)


if __name__ == "__main__":
    unittest.main()
