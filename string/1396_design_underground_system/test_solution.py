import unittest
from pathlib import Path
from runpy import run_path

UndergroundSystem = run_path(str(Path(__file__).with_name("solution.py")))['UndergroundSystem']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = UndergroundSystem()
        self.assertEqual(obj.checkIn(45, 'Leyton', 3), None)
        self.assertEqual(obj.checkIn(32, 'Paradise', 8), None)
        self.assertEqual(obj.checkIn(27, 'Leyton', 10), None)
        self.assertEqual(obj.checkOut(45, 'Waterloo', 15), None)
        self.assertEqual(obj.checkOut(27, 'Waterloo', 20), None)
        self.assertEqual(obj.checkOut(32, 'Cambridge', 22), None)
        self.assertEqual(obj.getAverageTime('Paradise', 'Cambridge'), 14.0)
        self.assertEqual(obj.getAverageTime('Leyton', 'Waterloo'), 11.0)
        self.assertEqual(obj.checkIn(10, 'Leyton', 24), None)
        self.assertEqual(obj.getAverageTime('Leyton', 'Waterloo'), 11.0)
        self.assertEqual(obj.checkOut(10, 'Waterloo', 38), None)
        self.assertEqual(obj.getAverageTime('Leyton', 'Waterloo'), 12.0)

    def test_example_2(self):
        obj = UndergroundSystem()
        self.assertEqual(obj.checkIn(10, 'Leyton', 3), None)
        self.assertEqual(obj.checkOut(10, 'Paradise', 8), None)
        self.assertEqual(obj.getAverageTime('Leyton', 'Paradise'), 5.0)
        self.assertEqual(obj.checkIn(5, 'Leyton', 10), None)
        self.assertEqual(obj.checkOut(5, 'Paradise', 16), None)
        self.assertEqual(obj.getAverageTime('Leyton', 'Paradise'), 5.5)
        self.assertEqual(obj.checkIn(2, 'Leyton', 21), None)
        self.assertEqual(obj.checkOut(2, 'Paradise', 30), None)
        self.assertEqual(obj.getAverageTime('Leyton', 'Paradise'), 6.66667)


if __name__ == "__main__":
    unittest.main()
