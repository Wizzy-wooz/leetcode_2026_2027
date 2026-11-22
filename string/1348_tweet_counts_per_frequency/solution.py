"""LeetCode 1348. Tweet Counts Per Frequency

https://leetcode.com/problems/tweet-counts-per-frequency/
"""

from __future__ import annotations


class TweetCounts:
    def __init__(self):
        raise NotImplementedError()

    def recordTweet(self, tweetName: str, time: int) -> None:
        raise NotImplementedError()

    def getTweetCountsPerFrequency(self, freq: str, tweetName: str, startTime: int, endTime: int) -> list[int]:
        raise NotImplementedError()
