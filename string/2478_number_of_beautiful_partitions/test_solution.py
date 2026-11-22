import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().beautifulPartitions('23542185131', 3, 2)
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().beautifulPartitions('23542185131', 3, 3)
        self.assertEqual(actual, 1)

    def test_example_3(self):
        actual = Solution().beautifulPartitions('3312958', 3, 1)
        self.assertEqual(actual, 1)


if __name__ == "__main__":
    unittest.main()
