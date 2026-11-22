import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().mergeCharacters('abca', 3)
        self.assertEqual(actual, 'abc')

    def test_example_2(self):
        actual = Solution().mergeCharacters('aabca', 2)
        self.assertEqual(actual, 'abca')

    def test_example_3(self):
        actual = Solution().mergeCharacters('yybyzybz', 2)
        self.assertEqual(actual, 'ybzybz')


if __name__ == "__main__":
    unittest.main()
