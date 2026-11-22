import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Codec = module["Codec"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Codec()
        url = 'https://example.com/a'
        self.assertEqual(obj.decode(obj.encode(url)), url)


if __name__ == "__main__":
    unittest.main()
