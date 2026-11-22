import unittest
from pathlib import Path
from runpy import run_path

TweetCounts = run_path(str(Path(__file__).with_name("solution.py")))['TweetCounts']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = TweetCounts()
        self.assertEqual(obj.recordTweet('tweet3', 0), None)
        self.assertEqual(obj.recordTweet('tweet3', 60), None)
        self.assertEqual(obj.recordTweet('tweet3', 10), None)
        self.assertEqual(obj.getTweetCountsPerFrequency('minute', 'tweet3', 0, 59), [2])
        self.assertEqual(obj.getTweetCountsPerFrequency('minute', 'tweet3', 0, 60), [2, 1])
        self.assertEqual(obj.recordTweet('tweet3', 120), None)
        self.assertEqual(obj.getTweetCountsPerFrequency('hour', 'tweet3', 0, 210), [4])


if __name__ == "__main__":
    unittest.main()
