import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().truncateSentence('Hello how are you Contestant', 4)
        self.assertEqual(actual, 'Hello how are you')

    def test_example_2(self):
        actual = Solution().truncateSentence('What is the solution to this problem', 4)
        self.assertEqual(actual, 'What is the solution')

    def test_example_3(self):
        actual = Solution().truncateSentence('chopper is not a tanuki', 5)
        self.assertEqual(actual, 'chopper is not a tanuki')


if __name__ == "__main__":
    unittest.main()
