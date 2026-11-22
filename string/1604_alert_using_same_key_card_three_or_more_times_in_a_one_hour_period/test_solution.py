import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().alertNames(['daniel', 'daniel', 'daniel', 'luis', 'luis', 'luis', 'luis'], ['10:00', '10:40', '11:00', '09:00', '11:00', '13:00', '15:00'])
        self.assertEqual(actual, ['daniel'])

    def test_example_2(self):
        actual = Solution().alertNames(['alice', 'alice', 'alice', 'bob', 'bob', 'bob', 'bob'], ['12:01', '12:00', '18:00', '21:00', '21:20', '21:30', '23:00'])
        self.assertEqual(actual, ['bob'])


if __name__ == "__main__":
    unittest.main()
