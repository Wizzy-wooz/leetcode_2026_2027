import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().findHighAccessEmployees([['a', '0549'], ['b', '0457'], ['a', '0532'], ['a', '0621'], ['b', '0540']])
        self.assertEqual(actual, ['a'])

    def test_example_2(self):
        actual = Solution().findHighAccessEmployees([['d', '0002'], ['c', '0808'], ['c', '0829'], ['e', '0215'], ['d', '1508'], ['d', '1444'], ['d', '1410'], ['c', '0809']])
        self.assertEqual(actual, ['c', 'd'])

    def test_example_3(self):
        actual = Solution().findHighAccessEmployees([['cd', '1025'], ['ab', '1025'], ['cd', '1046'], ['cd', '1055'], ['ab', '1124'], ['ab', '1120']])
        self.assertEqual(actual, ['ab', 'cd'])


if __name__ == "__main__":
    unittest.main()
