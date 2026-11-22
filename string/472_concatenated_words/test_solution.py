import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findAllConcatenatedWordsInADict(['cat', 'cats', 'catsdogcats', 'dog', 'dogcatsdog', 'hippopotamuses', 'rat', 'ratcatdogcat'])
        self.assertCountEqual(actual, ['catsdogcats', 'dogcatsdog', 'ratcatdogcat'])

    def test_example_2(self):
        actual = Solution().findAllConcatenatedWordsInADict(['cat', 'dog', 'catdog'])
        self.assertCountEqual(actual, ['catdog'])


if __name__ == "__main__":
    unittest.main()
