import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countWordOccurrences(['hello wor', 'ld hello'], ['hello', 'world', 'wor'])
        self.assertEqual(actual, [2, 1, 0])

    def test_example_2(self):
        actual = Solution().countWordOccurrences(['a-b a--b ', 'a-', 'b'], ['a-b', 'a', 'b'])
        self.assertEqual(actual, [2, 1, 1])

    def test_example_3(self):
        actual = Solution().countWordOccurrences(['-cat dog- mouse'], ['cat', 'dog', 'mouse', 'cat-dog'])
        self.assertEqual(actual, [1, 1, 1, 0])


if __name__ == "__main__":
    unittest.main()
