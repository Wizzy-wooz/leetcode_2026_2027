import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Solution = module["Solution"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Solution()
        self.assertTrue(obj.isSolvable(['SEND', 'MORE'], 'MONEY'))


if __name__ == "__main__":
    unittest.main()
