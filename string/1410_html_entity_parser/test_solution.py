import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().entityParser('&amp; is an HTML entity but &ambassador; is not.')
        self.assertEqual(actual, '& is an HTML entity but &ambassador; is not.')

    def test_example_2(self):
        actual = Solution().entityParser('and I quote: &quot;...&quot;')
        self.assertEqual(actual, 'and I quote: "..."')


if __name__ == "__main__":
    unittest.main()
