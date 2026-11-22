import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().areSentencesSimilarTwo(['great', 'acting', 'skills'], ['fine', 'drama', 'talent'], [['great', 'good'], ['fine', 'good'], ['drama', 'acting'], ['skills', 'talent']])
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().areSentencesSimilarTwo(['I', 'love', 'leetcode'], ['I', 'love', 'onepiece'], [['manga', 'onepiece'], ['platform', 'anime'], ['leetcode', 'platform'], ['anime', 'manga']])
        self.assertEqual(actual, True)

    def test_example_3(self):
        actual = Solution().areSentencesSimilarTwo(['I', 'love', 'leetcode'], ['I', 'love', 'onepiece'], [['manga', 'hunterXhunter'], ['platform', 'anime'], ['leetcode', 'platform'], ['anime', 'manga']])
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
