import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().reverseOnlyLetters('ab-cd')
        self.assertEqual(actual, 'dc-ba')

    def test_example_2(self):
        actual = Solution().reverseOnlyLetters('a-bC-dEf-ghIj')
        self.assertEqual(actual, 'j-Ih-gfE-dCba')

    def test_example_3(self):
        actual = Solution().reverseOnlyLetters('Test1ng-Leet=code-Q!')
        self.assertEqual(actual, 'Qedo1ct-eeLg=ntse-T!')


if __name__ == "__main__":
    unittest.main()
