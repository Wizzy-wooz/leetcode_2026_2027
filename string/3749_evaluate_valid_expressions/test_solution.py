import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().evaluateExpression('add(2,3)')
        self.assertEqual(actual, 5)

    def test_example_2(self):
        actual = Solution().evaluateExpression('-42')
        self.assertEqual(actual, -42)

    def test_example_3(self):
        actual = Solution().evaluateExpression('div(mul(4,sub(9,5)),add(1,1))')
        self.assertEqual(actual, 8)


if __name__ == "__main__":
    unittest.main()
