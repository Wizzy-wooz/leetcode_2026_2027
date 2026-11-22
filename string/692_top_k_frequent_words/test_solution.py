import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().topKFrequent(['i', 'love', 'leetcode', 'i', 'love', 'coding'], 2)
        self.assertEqual(actual, ['i', 'love'])

    def test_example_2(self):
        actual = Solution().topKFrequent(['the', 'day', 'is', 'sunny', 'the', 'the', 'the', 'sunny', 'is', 'is'], 4)
        self.assertEqual(actual, ['the', 'is', 'sunny', 'day'])


if __name__ == "__main__":
    unittest.main()
