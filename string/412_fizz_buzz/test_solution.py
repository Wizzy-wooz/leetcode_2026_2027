import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().fizzBuzz(3)
        self.assertEqual(actual, ['1', '2', 'Fizz'])

    def test_example_2(self):
        actual = Solution().fizzBuzz(5)
        self.assertEqual(actual, ['1', '2', 'Fizz', '4', 'Buzz'])

    def test_example_3(self):
        actual = Solution().fizzBuzz(15)
        self.assertEqual(actual, ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz'])


if __name__ == "__main__":
    unittest.main()
