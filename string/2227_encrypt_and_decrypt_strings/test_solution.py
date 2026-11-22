import unittest
from pathlib import Path
from runpy import run_path

Encrypter = run_path(str(Path(__file__).with_name("solution.py")))['Encrypter']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = Encrypter(['a', 'b', 'c', 'd'], ['ei', 'zf', 'ei', 'am'], ['abcd', 'acbd', 'adbc', 'badc', 'dacb', 'cadb', 'cbda', 'abad'])
        self.assertEqual(obj.encrypt('abcd'), 'eizfeiam')
        self.assertEqual(obj.decrypt('eizfeiam'), 2)


if __name__ == "__main__":
    unittest.main()
