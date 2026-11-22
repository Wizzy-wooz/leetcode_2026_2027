import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example(self):
        self.assertEqual(Solution().mostSimilar(2, [[0,1]], ['ATL','DXB'], ['ATL','DXB']), [0, 1])


if __name__ == "__main__":
    unittest.main()
