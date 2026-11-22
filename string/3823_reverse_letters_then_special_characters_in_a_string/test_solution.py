import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reverseByType(')ebc#da@f(')
        self.assertEqual(actual, '(fad@cb#e)')

    def test_example_2(self):
        actual = Solution().reverseByType('z')
        self.assertEqual(actual, 'z')

    def test_example_3(self):
        actual = Solution().reverseByType('!@#$%^&*()')
        self.assertEqual(actual, ')(*&^%$#@!')


if __name__ == "__main__":
    unittest.main()
