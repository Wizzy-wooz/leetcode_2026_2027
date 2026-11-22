import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().replaceWords(['cat', 'bat', 'rat'], 'the cattle was rattled by the battery')
        self.assertEqual(actual, 'the cat was rat by the bat')

    def test_example_2(self):
        actual = Solution().replaceWords(['a', 'b', 'c'], 'aadsfasf absbs bbab cadsfafs')
        self.assertEqual(actual, 'a a b c')


if __name__ == "__main__":
    unittest.main()
