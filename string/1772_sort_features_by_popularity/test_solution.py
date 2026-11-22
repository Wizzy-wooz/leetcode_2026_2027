import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().sortFeatures(['cooler', 'lock', 'touch'], ['i like cooler cooler', 'lock touch cool', 'locker like touch'])
        self.assertEqual(actual, ['touch', 'cooler', 'lock'])

    def test_example_2(self):
        actual = Solution().sortFeatures(['a', 'aa', 'b', 'c'], ['a', 'a aa', 'a a a a a', 'b a'])
        self.assertEqual(actual, ['a', 'aa', 'b', 'c'])


if __name__ == "__main__":
    unittest.main()
