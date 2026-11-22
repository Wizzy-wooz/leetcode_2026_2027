import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sortSentence('is2 sentence4 This1 a3')
        self.assertEqual(actual, 'This is a sentence')

    def test_example_2(self):
        actual = Solution().sortSentence('Myself2 Me1 I4 and3')
        self.assertEqual(actual, 'Me Myself and I')


if __name__ == "__main__":
    unittest.main()
