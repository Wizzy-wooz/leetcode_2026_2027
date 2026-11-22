import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().beautifulIndices('isawsquirrelnearmysquirrelhouseohmy', 'my', 'squirrel', 15)
        self.assertEqual(actual, [16, 33])

    def test_example_2(self):
        actual = Solution().beautifulIndices('abcd', 'a', 'a', 4)
        self.assertEqual(actual, [0])


if __name__ == "__main__":
    unittest.main()
