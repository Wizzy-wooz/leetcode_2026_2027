import unittest
from pathlib import Path
from runpy import run_path

module = run_path(str(Path(__file__).with_name("solution.py")))
Solution = module["Solution"]


class TestSolution(unittest.TestCase):
    def test_example(self):
        obj = Solution()
        class HtmlParser:
            def getUrls(self, url):
                return ['http://a.org/b', 'http://b.org'] if url == 'http://a.org' else []
        self.assertCountEqual(obj.crawl('http://a.org', HtmlParser()), ['http://a.org', 'http://a.org/b'])


if __name__ == "__main__":
    unittest.main()
