-- 2669. Count Artist Occurrences On Spotify Ranking List
-- https://leetcode.com/problems/count-artist-occurrences-on-spotify-ranking-list/
--
-- Spotify(id, track_name, artist)
-- Write a solution to find how many times each artist appeared on the Spotify ranking list.
-- Return the result table having the artist's name along with the corresponding number of
-- occurrences ordered by occurrence count in descending order. If the occurrences are equal, then
-- it’s ordered by the artist’s name in ascending order.

SELECT
  artist,
  COUNT(1) AS occurrences
FROM Spotify
GROUP BY
  artist
ORDER BY
  occurrences DESC,
  artist NULLS FIRST;
