import unittest
from pathlib import Path
from runpy import run_path

TimeMap = run_path(str(Path(__file__).with_name("solution.py")))['TimeMap']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = TimeMap()
        self.assertEqual(obj.set('foo', 'bar', 1), None)
        self.assertEqual(obj.get('foo', 1), 'bar')
        self.assertEqual(obj.get('foo', 3), 'bar')
        self.assertEqual(obj.set('foo', 'bar2', 4), None)
        self.assertEqual(obj.get('foo', 4), 'bar2')
        self.assertEqual(obj.get('foo', 5), 'bar2')


if __name__ == "__main__":
    unittest.main()
