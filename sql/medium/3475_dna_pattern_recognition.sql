-- 3475. DNA Pattern Recognition
-- https://leetcode.com/problems/dna-pattern-recognition/
--
-- Samples(sample_id, dna_sequence, species)
-- Biologists are studying basic patterns in DNA sequences. Write a solution to identify sample_id
-- with the following patterns:
-- Sequences that start with ATG (a common start codon)
-- Sequences that end with either TAA, TAG, or TGA (stop codons)
-- Sequences containing the motif ATAT (a simple repeated pattern)
-- Sequences that have at least 3 consecutive G (like GGG or GGGG)
-- Return the result table ordered by sample_id in ascending order.

SELECT
  sample_id,
  dna_sequence,
  species,
  CAST(dna_sequence LIKE 'ATG%' AS INTEGER) AS has_start,
  CAST(REGEXP_MATCHES(dna_sequence, 'TAA$|TAG$|TGA$') AS INTEGER) AS has_stop,
  CAST(dna_sequence LIKE '%ATAT%' AS INTEGER) AS has_atat,
  CAST(REGEXP_MATCHES(dna_sequence, 'GGG+') AS INTEGER) AS has_ggg
FROM Samples
ORDER BY
  1 NULLS FIRST;
