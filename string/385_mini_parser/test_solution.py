import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


def unpack(node):
    if node.isInteger():
        return node.getInteger()
    return [unpack(child) for child in node.getList()]


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().deserialize('324')
        self.assertEqual(unpack(actual), 324)

    def test_example_2(self):
        actual = Solution().deserialize('[123,[456,[789]]]')
        self.assertEqual(unpack(actual), [123, [456, [789]]])


if __name__ == "__main__":
    unittest.main()
