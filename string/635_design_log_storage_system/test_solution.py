import unittest
from pathlib import Path
from runpy import run_path

LogSystem = run_path(str(Path(__file__).with_name("solution.py")))['LogSystem']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = LogSystem()
        self.assertEqual(obj.put(1, '2017:01:01:23:59:59'), None)
        self.assertEqual(obj.put(2, '2017:01:01:22:59:59'), None)
        self.assertEqual(obj.put(3, '2016:01:01:00:00:00'), None)
        self.assertEqual(obj.retrieve('2016:01:01:01:01:01', '2017:01:01:23:00:00', 'Year'), [3, 2, 1])
        self.assertEqual(obj.retrieve('2016:01:01:01:01:01', '2017:01:01:23:00:00', 'Hour'), [2, 1])


if __name__ == "__main__":
    unittest.main()
