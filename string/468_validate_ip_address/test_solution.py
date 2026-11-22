import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().validIPAddress('172.16.254.1')
        self.assertEqual(actual, 'IPv4')

    def test_example_2(self):
        actual = Solution().validIPAddress('2001:0db8:85a3:0:0:8A2E:0370:7334')
        self.assertEqual(actual, 'IPv6')

    def test_example_3(self):
        actual = Solution().validIPAddress('256.256.256.256')
        self.assertEqual(actual, 'Neither')


if __name__ == "__main__":
    unittest.main()
