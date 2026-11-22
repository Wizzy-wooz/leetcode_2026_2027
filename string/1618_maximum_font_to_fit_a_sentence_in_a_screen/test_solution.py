import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Solution = module["Solution"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Solution()
        class FontInfo:
            def getWidth(self, fontSize, ch):
                return fontSize
            def getHeight(self, fontSize):
                return fontSize
        self.assertEqual(obj.maxFont('ab', 6, 10, [2, 3, 4], FontInfo()), 3)


if __name__ == "__main__":
    unittest.main()
