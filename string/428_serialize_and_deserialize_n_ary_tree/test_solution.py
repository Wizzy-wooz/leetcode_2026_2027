import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Codec = module["Codec"]
Node = module["Node"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Codec()
        root = obj.deserialize(obj.serialize(Node(1, [Node(2, [])])))
        self.assertEqual((root.val, [c.val for c in root.children]), (1, [2]))


if __name__ == "__main__":
    unittest.main()
