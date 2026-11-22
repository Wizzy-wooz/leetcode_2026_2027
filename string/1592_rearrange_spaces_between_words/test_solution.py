import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reorderSpaces('  this   is  a sentence ')
        self.assertEqual(actual, 'this   is   a   sentence')

    def test_example_2(self):
        actual = Solution().reorderSpaces(' practice   makes   perfect')
        self.assertEqual(actual, 'practice   makes   perfect ')


if __name__ == "__main__":
    unittest.main()
