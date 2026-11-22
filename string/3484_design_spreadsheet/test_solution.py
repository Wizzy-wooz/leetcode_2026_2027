import unittest
from pathlib import Path
from runpy import run_path

Spreadsheet = run_path(str(Path(__file__).with_name("solution.py")))['Spreadsheet']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = Spreadsheet(3)
        self.assertEqual(obj.getValue('=5+7'), 12)
        self.assertEqual(obj.setCell('A1', 10), None)
        self.assertEqual(obj.getValue('=A1+6'), 16)
        self.assertEqual(obj.setCell('B2', 15), None)
        self.assertEqual(obj.getValue('=A1+B2'), 25)
        self.assertEqual(obj.resetCell('A1'), None)
        self.assertEqual(obj.getValue('=A1+B2'), 15)


if __name__ == "__main__":
    unittest.main()
