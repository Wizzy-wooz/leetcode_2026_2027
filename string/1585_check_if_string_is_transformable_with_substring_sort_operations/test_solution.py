import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().isTransformable('84532', '34852')
        self.assertEqual(actual, True)

    def test_example_2(self):
        actual = Solution().isTransformable('34521', '23415')
        self.assertEqual(actual, True)

    def test_example_3(self):
        actual = Solution().isTransformable('12345', '12435')
        self.assertEqual(actual, False)


if __name__ == "__main__":
    unittest.main()
