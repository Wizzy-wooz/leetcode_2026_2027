import unittest
from pathlib import Path
from runpy import run_path

WordFilter = run_path(str(Path(__file__).with_name("solution.py")))['WordFilter']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = WordFilter(['apple'])
        self.assertEqual(obj.f('a', 'e'), 0)


if __name__ == "__main__":
    unittest.main()
