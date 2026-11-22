import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().toGoatLatin('I speak Goat Latin')
        self.assertEqual(actual, 'Imaa peaksmaaa oatGmaaaa atinLmaaaaa')

    def test_example_2(self):
        actual = Solution().toGoatLatin('The quick brown fox jumped over the lazy dog')
        self.assertEqual(actual, 'heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa')


if __name__ == "__main__":
    unittest.main()
