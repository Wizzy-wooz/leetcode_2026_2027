import unittest
from pathlib import Path
from runpy import run_path

WordDistance = run_path(str(Path(__file__).with_name("solution.py")))['WordDistance']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = WordDistance(['practice', 'makes', 'perfect', 'coding', 'makes'])
        self.assertEqual(obj.shortest('coding', 'practice'), 3)
        self.assertEqual(obj.shortest('makes', 'coding'), 1)


if __name__ == "__main__":
    unittest.main()
