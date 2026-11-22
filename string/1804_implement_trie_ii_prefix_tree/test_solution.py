import unittest
from pathlib import Path
from runpy import run_path

Trie = run_path(str(Path(__file__).with_name("solution.py")))['Trie']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = Trie()
        self.assertEqual(obj.insert('apple'), None)
        self.assertEqual(obj.insert('apple'), None)
        self.assertEqual(obj.countWordsEqualTo('apple'), 2)
        self.assertEqual(obj.countWordsStartingWith('app'), 2)
        self.assertEqual(obj.erase('apple'), None)
        self.assertEqual(obj.countWordsEqualTo('apple'), 1)
        self.assertEqual(obj.countWordsStartingWith('app'), 1)
        self.assertEqual(obj.erase('apple'), None)
        self.assertEqual(obj.countWordsStartingWith('app'), 0)


if __name__ == "__main__":
    unittest.main()
