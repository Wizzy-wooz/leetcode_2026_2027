import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().generateSentences([['happy', 'joy'], ['sad', 'sorrow'], ['joy', 'cheerful']], 'I am happy today but was sad yesterday')
        self.assertEqual(actual, ['I am cheerful today but was sad yesterday', 'I am cheerful today but was sorrow yesterday', 'I am happy today but was sad yesterday', 'I am happy today but was sorrow yesterday', 'I am joy today but was sad yesterday', 'I am joy today but was sorrow yesterday'])

    def test_example_2(self):
        actual = Solution().generateSentences([['happy', 'joy'], ['cheerful', 'glad']], 'I am happy today but was sad yesterday')
        self.assertEqual(actual, ['I am happy today but was sad yesterday', 'I am joy today but was sad yesterday'])


if __name__ == "__main__":
    unittest.main()
