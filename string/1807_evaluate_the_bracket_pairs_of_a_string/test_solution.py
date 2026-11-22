import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().evaluate('(name)is(age)yearsold', [['name', 'bob'], ['age', 'two']])
        self.assertEqual(actual, 'bobistwoyearsold')

    def test_example_2(self):
        actual = Solution().evaluate('hi(name)', [['a', 'b']])
        self.assertEqual(actual, 'hi?')

    def test_example_3(self):
        actual = Solution().evaluate('(a)(a)(a)aaa', [['a', 'yes']])
        self.assertEqual(actual, 'yesyesyesaaa')


if __name__ == "__main__":
    unittest.main()
