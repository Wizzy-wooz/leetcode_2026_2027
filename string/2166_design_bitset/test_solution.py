import unittest
from pathlib import Path
from runpy import run_path

Bitset = run_path(str(Path(__file__).with_name("solution.py")))['Bitset']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = Bitset(5)
        self.assertEqual(obj.fix(3), None)
        self.assertEqual(obj.fix(1), None)
        self.assertEqual(obj.flip(), None)
        self.assertEqual(obj.all(), False)
        self.assertEqual(obj.unfix(0), None)
        self.assertEqual(obj.flip(), None)
        self.assertEqual(obj.one(), True)
        self.assertEqual(obj.unfix(0), None)
        self.assertEqual(obj.count(), 2)
        self.assertEqual(obj.toString(), '01010')


if __name__ == "__main__":
    unittest.main()
