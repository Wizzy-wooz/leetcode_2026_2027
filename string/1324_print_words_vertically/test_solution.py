import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().printVertically('HOW ARE YOU')
        self.assertEqual(actual, ['HAY', 'ORO', 'WEU'])

    def test_example_2(self):
        actual = Solution().printVertically('TO BE OR NOT TO BE')
        self.assertEqual(actual, ['TBONTB', 'OEROOE', '   T'])

    def test_example_3(self):
        actual = Solution().printVertically('CONTEST IS COMING')
        self.assertEqual(actual, ['CIC', 'OSO', 'N M', 'T I', 'E N', 'S G', 'T'])


if __name__ == "__main__":
    unittest.main()
