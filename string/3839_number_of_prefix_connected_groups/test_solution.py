import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().prefixConnected(['apple', 'apply', 'banana', 'bandit'], 2)
        self.assertEqual(actual, 2)

    def test_example_2(self):
        actual = Solution().prefixConnected(['car', 'cat', 'cartoon'], 3)
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().prefixConnected(['bat', 'dog', 'dog', 'doggy', 'bat'], 3)
        self.assertEqual(actual, 2)


if __name__ == "__main__":
    unittest.main()
