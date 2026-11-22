import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().displayTable([['David', '3', 'Ceviche'], ['Corina', '10', 'Beef Burrito'], ['David', '3', 'Fried Chicken'], ['Carla', '5', 'Water'], ['Carla', '5', 'Ceviche'], ['Rous', '3', 'Ceviche']])
        self.assertEqual(actual, [['Table', 'Beef Burrito', 'Ceviche', 'Fried Chicken', 'Water'], ['3', '0', '2', '1', '0'], ['5', '0', '1', '0', '1'], ['10', '1', '0', '0', '0']])

    def test_example_2(self):
        actual = Solution().displayTable([['James', '12', 'Fried Chicken'], ['Ratesh', '12', 'Fried Chicken'], ['Amadeus', '12', 'Fried Chicken'], ['Adam', '1', 'Canadian Waffles'], ['Brianna', '1', 'Canadian Waffles']])
        self.assertEqual(actual, [['Table', 'Canadian Waffles', 'Fried Chicken'], ['1', '2', '0'], ['12', '0', '3']])

    def test_example_3(self):
        actual = Solution().displayTable([['Laura', '2', 'Bean Burrito'], ['Jhon', '2', 'Beef Burrito'], ['Melissa', '2', 'Soda']])
        self.assertEqual(actual, [['Table', 'Bean Burrito', 'Beef Burrito', 'Soda'], ['2', '1', '1', '1']])


if __name__ == "__main__":
    unittest.main()
