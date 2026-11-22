import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Solution = module["Solution"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Solution()
        class Master:
            found = False
            calls = 0
            def guess(self, word):
                self.calls += 1
                self.found |= word == 'aaaaaa'
                return 6 if self.found else -1
        master = Master()
        obj.findSecretWord(['aaaaaa'], master)
        self.assertTrue(master.found)
        self.assertLessEqual(master.calls, 10)


if __name__ == "__main__":
    unittest.main()
