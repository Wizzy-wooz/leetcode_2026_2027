import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findRestaurant(['Shogun', 'Tapioca Express', 'Burger King', 'KFC'], ['Piatti', 'The Grill at Torrey Pines', 'Hungry Hunter Steakhouse', 'Shogun'])
        self.assertEqual(actual, ['Shogun'])

    def test_example_2(self):
        actual = Solution().findRestaurant(['Shogun', 'Tapioca Express', 'Burger King', 'KFC'], ['KFC', 'Shogun', 'Burger King'])
        self.assertEqual(actual, ['Shogun'])

    def test_example_3(self):
        actual = Solution().findRestaurant(['happy', 'sad', 'good'], ['sad', 'happy', 'good'])
        self.assertEqual(actual, ['sad', 'happy'])


if __name__ == "__main__":
    unittest.main()
