import unittest
from pathlib import Path
from runpy import run_path

AutocompleteSystem = run_path(str(Path(__file__).with_name("solution.py")))['AutocompleteSystem']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = AutocompleteSystem(['i love you', 'island', 'iroman', 'i love leetcode'], [5, 3, 2, 2])
        self.assertEqual(obj.input('i'), ['i love you', 'island', 'i love leetcode'])
        self.assertEqual(obj.input(' '), ['i love you', 'i love leetcode'])
        self.assertEqual(obj.input('a'), [])
        self.assertEqual(obj.input('#'), [])


if __name__ == "__main__":
    unittest.main()
