import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findItinerary([['MUC', 'LHR'], ['JFK', 'MUC'], ['SFO', 'SJC'], ['LHR', 'SFO']])
        self.assertEqual(actual, ['JFK', 'MUC', 'LHR', 'SFO', 'SJC'])

    def test_example_2(self):
        actual = Solution().findItinerary([['JFK', 'SFO'], ['JFK', 'ATL'], ['SFO', 'ATL'], ['ATL', 'JFK'], ['ATL', 'SFO']])
        self.assertEqual(actual, ['JFK', 'ATL', 'JFK', 'SFO', 'ATL', 'SFO'])


if __name__ == "__main__":
    unittest.main()
