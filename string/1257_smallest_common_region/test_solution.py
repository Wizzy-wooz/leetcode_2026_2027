import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findSmallestRegion([['Earth', 'North America', 'South America'], ['North America', 'United States', 'Canada'], ['United States', 'New York', 'Boston'], ['Canada', 'Ontario', 'Quebec'], ['South America', 'Brazil']], 'Quebec', 'New York')
        self.assertEqual(actual, 'North America')

    def test_example_2(self):
        actual = Solution().findSmallestRegion([['Earth', 'North America', 'South America'], ['North America', 'United States', 'Canada'], ['United States', 'New York', 'Boston'], ['Canada', 'Ontario', 'Quebec'], ['South America', 'Brazil']], 'Canada', 'South America')
        self.assertEqual(actual, 'Earth')


if __name__ == "__main__":
    unittest.main()
