import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().interpret('G()(al)')
        self.assertEqual(actual, 'Goal')

    def test_example_2(self):
        actual = Solution().interpret('G()()()()(al)')
        self.assertEqual(actual, 'Gooooal')

    def test_example_3(self):
        actual = Solution().interpret('(al)G(al)()()G')
        self.assertEqual(actual, 'alGalooG')


if __name__ == "__main__":
    unittest.main()
