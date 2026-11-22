import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Codec = module["Codec"]
TreeNode = module["TreeNode"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Codec()
        root = obj.deserialize(obj.serialize(TreeNode(2, TreeNode(1))))
        self.assertEqual((root.val, root.left.val, root.right), (2, 1, None))


if __name__ == "__main__":
    unittest.main()
