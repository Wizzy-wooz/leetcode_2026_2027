import unittest
from pathlib import Path
from runpy import run_path

MapSum = run_path(str(Path(__file__).with_name("solution.py")))['MapSum']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = MapSum()
        self.assertEqual(obj.insert('apple', 3), None)
        self.assertEqual(obj.sum('ap'), 3)
        self.assertEqual(obj.insert('app', 2), None)
        self.assertEqual(obj.sum('ap'), 5)


if __name__ == "__main__":
    unittest.main()
