import unittest
from pathlib import Path
from runpy import run_path

FileSystem = run_path(str(Path(__file__).with_name("solution.py")))['FileSystem']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = FileSystem()
        self.assertEqual(obj.ls('/'), [])
        self.assertEqual(obj.mkdir('/a/b/c'), None)
        self.assertEqual(obj.addContentToFile('/a/b/c/d', 'hello'), None)
        self.assertEqual(obj.ls('/'), ['a'])
        self.assertEqual(obj.readContentFromFile('/a/b/c/d'), 'hello')


if __name__ == "__main__":
    unittest.main()
