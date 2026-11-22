import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().beforeAndAfterPuzzles(['writing code', 'code rocks'])
        self.assertEqual(actual, ['writing code rocks'])

    def test_example_2(self):
        actual = Solution().beforeAndAfterPuzzles(['mission statement', 'a quick bite to eat', 'a chip off the old block', 'chocolate bar', 'mission impossible', 'a man on a mission', 'block party', 'eat my words', 'bar of soap'])
        self.assertEqual(actual, ['a chip off the old block party', 'a man on a mission impossible', 'a man on a mission statement', 'a quick bite to eat my words', 'chocolate bar of soap'])

    def test_example_3(self):
        actual = Solution().beforeAndAfterPuzzles(['a', 'b', 'a'])
        self.assertEqual(actual, ['a'])

    def test_example_4(self):
        actual = Solution().beforeAndAfterPuzzles(['ab ba', 'ba ab', 'ab ba'])
        self.assertEqual(actual, ['ab ba ab', 'ba ab ba'])


if __name__ == "__main__":
    unittest.main()
