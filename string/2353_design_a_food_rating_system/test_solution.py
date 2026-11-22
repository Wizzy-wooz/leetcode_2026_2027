import unittest
from pathlib import Path
from runpy import run_path

FoodRatings = run_path(str(Path(__file__).with_name("solution.py")))['FoodRatings']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = FoodRatings(['kimchi', 'miso', 'sushi', 'moussaka', 'ramen', 'bulgogi'], ['korean', 'japanese', 'japanese', 'greek', 'japanese', 'korean'], [9, 12, 8, 15, 14, 7])
        self.assertEqual(obj.highestRated('korean'), 'kimchi')
        self.assertEqual(obj.highestRated('japanese'), 'ramen')
        self.assertEqual(obj.changeRating('sushi', 16), None)
        self.assertEqual(obj.highestRated('japanese'), 'sushi')
        self.assertEqual(obj.changeRating('ramen', 16), None)
        self.assertEqual(obj.highestRated('japanese'), 'ramen')


if __name__ == "__main__":
    unittest.main()
