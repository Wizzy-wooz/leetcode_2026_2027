import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().spellchecker(['KiTe', 'kite', 'hare', 'Hare'], ['kite', 'Kite', 'KiTe', 'Hare', 'HARE', 'Hear', 'hear', 'keti', 'keet', 'keto'])
        self.assertEqual(actual, ['kite', 'KiTe', 'KiTe', 'Hare', 'hare', '', '', 'KiTe', '', 'KiTe'])

    def test_example_2(self):
        actual = Solution().spellchecker(['yellow'], ['YellOw'])
        self.assertEqual(actual, ['yellow'])


if __name__ == "__main__":
    unittest.main()
