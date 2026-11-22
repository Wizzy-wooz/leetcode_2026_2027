import unittest
from pathlib import Path
from runpy import run_path

CombinationIterator = run_path(str(Path(__file__).with_name("solution.py")))['CombinationIterator']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = CombinationIterator('abc', 2)
        self.assertEqual(obj.next(), 'ab')
        self.assertEqual(obj.hasNext(), True)
        self.assertEqual(obj.next(), 'ac')
        self.assertEqual(obj.hasNext(), True)
        self.assertEqual(obj.next(), 'bc')
        self.assertEqual(obj.hasNext(), False)


if __name__ == "__main__":
    unittest.main()
