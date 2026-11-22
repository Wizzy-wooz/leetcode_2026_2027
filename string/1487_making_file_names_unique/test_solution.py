import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().getFolderNames(['pes', 'fifa', 'gta', 'pes(2019)'])
        self.assertEqual(actual, ['pes', 'fifa', 'gta', 'pes(2019)'])

    def test_example_2(self):
        actual = Solution().getFolderNames(['gta', 'gta(1)', 'gta', 'avalon'])
        self.assertEqual(actual, ['gta', 'gta(1)', 'gta(2)', 'avalon'])

    def test_example_3(self):
        actual = Solution().getFolderNames(['onepiece', 'onepiece(1)', 'onepiece(2)', 'onepiece(3)', 'onepiece'])
        self.assertEqual(actual, ['onepiece', 'onepiece(1)', 'onepiece(2)', 'onepiece(3)', 'onepiece(4)'])


if __name__ == "__main__":
    unittest.main()
