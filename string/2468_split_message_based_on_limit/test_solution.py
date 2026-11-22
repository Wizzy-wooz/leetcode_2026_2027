import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().splitMessage('this is really a very awesome message', 9)
        self.assertEqual(actual, ['thi<1/14>', 's i<2/14>', 's r<3/14>', 'eal<4/14>', 'ly <5/14>', 'a v<6/14>', 'ery<7/14>', ' aw<8/14>', 'eso<9/14>', 'me<10/14>', ' m<11/14>', 'es<12/14>', 'sa<13/14>', 'ge<14/14>'])

    def test_example_2(self):
        actual = Solution().splitMessage('short message', 15)
        self.assertEqual(actual, ['short mess<1/2>', 'age<2/2>'])


if __name__ == "__main__":
    unittest.main()
