import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().palindromePairs(['abcd', 'dcba', 'lls', 's', 'sssll'])
        self.assertCountEqual(actual, [[0, 1], [1, 0], [3, 2], [2, 4]])

    def test_example_2(self):
        actual = Solution().palindromePairs(['bat', 'tab', 'cat'])
        self.assertCountEqual(actual, [[0, 1], [1, 0]])

    def test_example_3(self):
        actual = Solution().palindromePairs(['a', ''])
        self.assertCountEqual(actual, [[0, 1], [1, 0]])


if __name__ == "__main__":
    unittest.main()
