import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findAllRecipes(['bread'], [['yeast', 'flour']], ['yeast', 'flour', 'corn'])
        self.assertCountEqual(actual, ['bread'])

    def test_example_2(self):
        actual = Solution().findAllRecipes(['bread', 'sandwich'], [['yeast', 'flour'], ['bread', 'meat']], ['yeast', 'flour', 'meat'])
        self.assertCountEqual(actual, ['bread', 'sandwich'])

    def test_example_3(self):
        actual = Solution().findAllRecipes(['bread', 'sandwich', 'burger'], [['yeast', 'flour'], ['bread', 'meat'], ['sandwich', 'meat', 'bread']], ['yeast', 'flour', 'meat'])
        self.assertCountEqual(actual, ['bread', 'sandwich', 'burger'])


if __name__ == "__main__":
    unittest.main()
