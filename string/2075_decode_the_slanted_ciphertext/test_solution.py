import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().decodeCiphertext('ch   ie   pr', 3)
        self.assertEqual(actual, 'cipher')

    def test_example_2(self):
        actual = Solution().decodeCiphertext('iveo    eed   l te   olc', 4)
        self.assertEqual(actual, 'i love leetcode')

    def test_example_3(self):
        actual = Solution().decodeCiphertext('coding', 1)
        self.assertEqual(actual, 'coding')


if __name__ == "__main__":
    unittest.main()
