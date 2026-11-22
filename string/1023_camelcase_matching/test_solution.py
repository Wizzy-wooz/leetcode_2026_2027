import unittest
from pathlib import Path
from runpy import run_path

Solution = run_path(str(Path(__file__).with_name("solution.py")))['Solution']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        actual = Solution().camelMatch(['FooBar', 'FooBarTest', 'FootBall', 'FrameBuffer', 'ForceFeedBack'], 'FB')
        self.assertEqual(actual, [True, False, True, True, False])

    def test_example_2(self):
        actual = Solution().camelMatch(['FooBar', 'FooBarTest', 'FootBall', 'FrameBuffer', 'ForceFeedBack'], 'FoBa')
        self.assertEqual(actual, [True, False, True, False, False])

    def test_example_3(self):
        actual = Solution().camelMatch(['FooBar', 'FooBarTest', 'FootBall', 'FrameBuffer', 'ForceFeedBack'], 'FoBaT')
        self.assertEqual(actual, [False, True, False, False, False])


if __name__ == "__main__":
    unittest.main()
