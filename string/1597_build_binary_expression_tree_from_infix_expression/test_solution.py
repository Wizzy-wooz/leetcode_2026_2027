import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Solution = module["Solution"]
Node = module["Node"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Solution()
        root = obj.expTree('2+3')
        self.assertEqual((root.val, root.left.val, root.right.val), ('+', '2', '3'))


if __name__ == "__main__":
    unittest.main()
