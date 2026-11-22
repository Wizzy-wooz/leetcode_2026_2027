import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Codec = module["Codec"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Codec()
        words = ['', 'a:b', '猫']
        self.assertEqual(Codec().decode(obj.encode(words)), words)


if __name__ == "__main__":
    unittest.main()
