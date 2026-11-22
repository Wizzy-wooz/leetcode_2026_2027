import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().countOfAtoms('H2O')
        self.assertEqual(actual, 'H2O')

    def test_example_2(self):
        actual = Solution().countOfAtoms('Mg(OH)2')
        self.assertEqual(actual, 'H2MgO2')

    def test_example_3(self):
        actual = Solution().countOfAtoms('K4(ON(SO3)2)2')
        self.assertEqual(actual, 'K4N2O14S4')


if __name__ == "__main__":
    unittest.main()
