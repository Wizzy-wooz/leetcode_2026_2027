import unittest
from pathlib import Path
from runpy import run_path

ValidWordAbbr = run_path(str(Path(__file__).with_name("solution.py")))['ValidWordAbbr']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = ValidWordAbbr(['deer', 'door', 'cake', 'card'])
        self.assertEqual(obj.isUnique('dear'), False)
        self.assertEqual(obj.isUnique('cart'), True)
        self.assertEqual(obj.isUnique('cane'), False)
        self.assertEqual(obj.isUnique('make'), True)
        self.assertEqual(obj.isUnique('cake'), True)


if __name__ == "__main__":
    unittest.main()
