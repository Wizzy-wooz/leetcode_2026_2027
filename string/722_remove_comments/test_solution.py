import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().removeComments(['/*Test program */', 'int main()', '{ ', '  // variable declaration ', 'int a, b, c;', '/* This is a test', '   multiline  ', '   comment for ', '   testing */', 'a = b + c;', '}'])
        self.assertEqual(actual, ['int main()', '{ ', '  ', 'int a, b, c;', 'a = b + c;', '}'])

    def test_example_2(self):
        actual = Solution().removeComments(['a/*comment', 'line', 'more_comment*/b'])
        self.assertEqual(actual, ['ab'])


if __name__ == "__main__":
    unittest.main()
