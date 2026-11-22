import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().minPartitions('32')
        self.assertEqual(actual, 3)

    def test_example_2(self):
        actual = Solution().minPartitions('82734')
        self.assertEqual(actual, 8)

    def test_example_3(self):
        actual = Solution().minPartitions('27346209830709182346')
        self.assertEqual(actual, 9)


if __name__ == "__main__":
    unittest.main()
