import unittest
from pathlib import Path
from runpy import run_path

StreamChecker = run_path(str(Path(__file__).with_name("solution.py")))['StreamChecker']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = StreamChecker(['cd', 'f', 'kl'])
        self.assertEqual(obj.query('a'), False)
        self.assertEqual(obj.query('b'), False)
        self.assertEqual(obj.query('c'), False)
        self.assertEqual(obj.query('d'), True)
        self.assertEqual(obj.query('e'), False)
        self.assertEqual(obj.query('f'), True)
        self.assertEqual(obj.query('g'), False)
        self.assertEqual(obj.query('h'), False)
        self.assertEqual(obj.query('i'), False)
        self.assertEqual(obj.query('j'), False)
        self.assertEqual(obj.query('k'), False)
        self.assertEqual(obj.query('l'), True)


if __name__ == "__main__":
    unittest.main()
