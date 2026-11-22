import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().majorityFrequencyGroup('aaabbbccdddde')
        self.assertEqual(actual, 'ab')

    def test_example_2(self):
        actual = Solution().majorityFrequencyGroup('abcd')
        self.assertEqual(actual, 'abcd')

    def test_example_3(self):
        actual = Solution().majorityFrequencyGroup('pfpfgi')
        self.assertEqual(actual, 'fp')


if __name__ == "__main__":
    unittest.main()
