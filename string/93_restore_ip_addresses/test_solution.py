import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().restoreIpAddresses('25525511135')
        self.assertCountEqual(actual, ['255.255.11.135', '255.255.111.35'])

    def test_example_2(self):
        actual = Solution().restoreIpAddresses('0000')
        self.assertCountEqual(actual, ['0.0.0.0'])

    def test_example_3(self):
        actual = Solution().restoreIpAddresses('101023')
        self.assertCountEqual(actual, ['1.0.10.23', '1.0.102.3', '10.1.0.23', '10.10.2.3', '101.0.2.3'])


if __name__ == "__main__":
    unittest.main()
