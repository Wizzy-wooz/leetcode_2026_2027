import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Excel = module["Excel"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Excel(3, "C")
        obj.set(1, 'A', 2)
        self.assertEqual(obj.sum(3, 'C', ['A1', 'A1:B2']), 4)
        obj.set(2, 'B', 2)
        self.assertEqual(obj.get(3, 'C'), 6)


if __name__ == "__main__":
    unittest.main()
