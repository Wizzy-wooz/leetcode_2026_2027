import unittest
from pathlib import Path
from runpy import run_path

StringIterator = run_path(str(Path(__file__).with_name("solution.py")))['StringIterator']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = StringIterator('L1e2t1C1o1d1e1')
        self.assertEqual(obj.next(), 'L')
        self.assertEqual(obj.next(), 'e')
        self.assertEqual(obj.next(), 'e')
        self.assertEqual(obj.next(), 't')
        self.assertEqual(obj.next(), 'C')
        self.assertEqual(obj.next(), 'o')
        self.assertEqual(obj.hasNext(), True)
        self.assertEqual(obj.next(), 'd')
        self.assertEqual(obj.hasNext(), True)


if __name__ == "__main__":
    unittest.main()
