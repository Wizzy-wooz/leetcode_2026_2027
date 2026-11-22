import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().stringIndices(['abcd', 'bcd', 'xbcd'], ['cd', 'bcd', 'xyz'])
        self.assertEqual(actual, [1, 1, 1])

    def test_example_2(self):
        actual = Solution().stringIndices(['abcdefgh', 'poiuygh', 'ghghgh'], ['gh', 'acbfgh', 'acbfegh'])
        self.assertEqual(actual, [2, 0, 2])


if __name__ == "__main__":
    unittest.main()
