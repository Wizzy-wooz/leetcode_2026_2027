import unittest
from pathlib import Path
from runpy import run_path

SQL = run_path(str(Path(__file__).with_name("solution.py")))['SQL']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = SQL(['one', 'two', 'three'], [2, 3, 1])
        self.assertEqual(obj.ins('two', ['first', 'second', 'third']), True)
        self.assertEqual(obj.sel('two', 1, 3), 'third')
        self.assertEqual(obj.ins('two', ['fourth', 'fifth', 'sixth']), True)
        self.assertEqual(obj.exp('two'), ['1,first,second,third', '2,fourth,fifth,sixth'])
        self.assertEqual(obj.rmv('two', 1), None)
        self.assertEqual(obj.sel('two', 2, 2), 'fifth')
        self.assertEqual(obj.exp('two'), ['2,fourth,fifth,sixth'])

    def test_example_2(self):
        obj = SQL(['one', 'two', 'three'], [2, 3, 1])
        self.assertEqual(obj.ins('two', ['first', 'second', 'third']), True)
        self.assertEqual(obj.sel('two', 1, 3), 'third')
        self.assertEqual(obj.rmv('two', 1), None)
        self.assertEqual(obj.sel('two', 1, 2), '<null>')
        self.assertEqual(obj.ins('two', ['fourth', 'fifth']), False)
        self.assertEqual(obj.ins('two', ['fourth', 'fifth', 'sixth']), True)


if __name__ == "__main__":
    unittest.main()
