import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().braceExpansionII('{a,b}{c,{d,e}}')
        self.assertEqual(actual, ['ac', 'ad', 'ae', 'bc', 'bd', 'be'])

    def test_example_2(self):
        actual = Solution().braceExpansionII('{{a,z},a{b,c},{ab,z}}')
        self.assertEqual(actual, ['a', 'ab', 'ac', 'z'])


if __name__ == "__main__":
    unittest.main()
