import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().accountsMerge([['John', 'johnsmith@mail.com', 'john_newyork@mail.com'], ['John', 'johnsmith@mail.com', 'john00@mail.com'], ['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com']])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'], ['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com']]])

    def test_example_2(self):
        actual = Solution().accountsMerge([['Gabe', 'Gabe0@m.co', 'Gabe3@m.co', 'Gabe1@m.co'], ['Kevin', 'Kevin3@m.co', 'Kevin5@m.co', 'Kevin0@m.co'], ['Ethan', 'Ethan5@m.co', 'Ethan4@m.co', 'Ethan0@m.co'], ['Hanzo', 'Hanzo3@m.co', 'Hanzo1@m.co', 'Hanzo0@m.co'], ['Fern', 'Fern5@m.co', 'Fern1@m.co', 'Fern0@m.co']])
        self.assertCountEqual([sorted(group) for group in actual], [sorted(group) for group in [['Ethan', 'Ethan0@m.co', 'Ethan4@m.co', 'Ethan5@m.co'], ['Gabe', 'Gabe0@m.co', 'Gabe1@m.co', 'Gabe3@m.co'], ['Hanzo', 'Hanzo0@m.co', 'Hanzo1@m.co', 'Hanzo3@m.co'], ['Kevin', 'Kevin0@m.co', 'Kevin3@m.co', 'Kevin5@m.co'], ['Fern', 'Fern0@m.co', 'Fern1@m.co', 'Fern5@m.co']]])


if __name__ == "__main__":
    unittest.main()
