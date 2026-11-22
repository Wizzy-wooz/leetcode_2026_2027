import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().suggestedProducts(['mobile', 'mouse', 'moneypot', 'monitor', 'mousepad'], 'mouse')
        self.assertEqual(actual, [['mobile', 'moneypot', 'monitor'], ['mobile', 'moneypot', 'monitor'], ['mouse', 'mousepad'], ['mouse', 'mousepad'], ['mouse', 'mousepad']])

    def test_example_2(self):
        actual = Solution().suggestedProducts(['havana'], 'havana')
        self.assertEqual(actual, [['havana'], ['havana'], ['havana'], ['havana'], ['havana'], ['havana']])


if __name__ == "__main__":
    unittest.main()
