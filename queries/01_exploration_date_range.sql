-- Purpose: Check the total number of questions and the available date range
-- before starting the analysis, to understand the size and limitations of the dataset.
--
-- Table: bigquery-public-data.stackoverflow.posts_questions

SELECT 
  COUNT(*) AS total_questions,
  MIN(creation_date) AS earliest_date,
  MAX(creation_date) AS latest_date
FROM `bigquery-public-data.stackoverflow.posts_questions`;

-- Result (as of Aug 2026):
-- total_questions: 23,020,127
-- earliest_date:   2008-07-31
-- latest_date:     2022-09-25
--
-- Note: data does not extend to the present day. Conclusions from this
-- analysis describe historical trends within this range, not the current
-- state of the tech market.
