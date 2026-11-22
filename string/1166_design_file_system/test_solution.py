import unittest
from pathlib import Path
from runpy import run_path

FileSystem = run_path(str(Path(__file__).with_name("solution.py")))['FileSystem']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = FileSystem()
        self.assertEqual(obj.createPath('/a', 1), True)
        self.assertEqual(obj.get('/a'), 1)

    def test_example_2(self):
        obj = FileSystem()
        self.assertEqual(obj.createPath('/leet', 1), True)
        self.assertEqual(obj.createPath('/leet/code', 2), True)
        self.assertEqual(obj.get('/leet/code'), 2)
        self.assertEqual(obj.createPath('/c/d', 1), False)
        self.assertEqual(obj.get('/c'), -1)


if __name__ == "__main__":
    unittest.main()
