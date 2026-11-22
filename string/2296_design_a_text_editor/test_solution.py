import unittest
from pathlib import Path
from runpy import run_path

TextEditor = run_path(str(Path(__file__).with_name("solution.py")))['TextEditor']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = TextEditor()
        self.assertEqual(obj.addText('leetcode'), None)
        self.assertEqual(obj.deleteText(4), 4)
        self.assertEqual(obj.addText('practice'), None)
        self.assertEqual(obj.cursorRight(3), 'etpractice')
        self.assertEqual(obj.cursorLeft(8), 'leet')
        self.assertEqual(obj.deleteText(10), 4)
        self.assertEqual(obj.cursorLeft(2), '')
        self.assertEqual(obj.cursorRight(6), 'practi')


if __name__ == "__main__":
    unittest.main()
