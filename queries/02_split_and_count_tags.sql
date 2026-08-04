-- Purpose: The `tags` column stores multiple tags in a single text field,
-- separated by "|" (e.g. "javascript|concurrency|async-await").
-- To analyze technologies individually, we need to split this column
-- into one row per tag using SPLIT() + UNNEST().
--
-- Table: bigquery-public-data.stackoverflow.posts_questions

-- Step 1: Explore what the split looks like (sample of 20 rows)
SELECT 
  id,
  title,
  tag,
  creation_date
FROM `bigquery-public-data.stackoverflow.posts_questions`,
UNNEST(SPLIT(tags, '|')) AS tag
LIMIT 20;

-- Result: confirmed that each question now generates one row per tag.
-- Example: id 73210679 appeared twice, once for "azure-container-registry"
-- and once for "docker-daemon".


-- Step 2: Count total questions per tag across the full dataset (2008-2022)
SELECT 
  tag,
  COUNT(*) AS question_count
FROM `bigquery-public-data.stackoverflow.posts_questions`,
UNNEST(SPLIT(tags, '|')) AS tag
GROUP BY tag
ORDER BY question_count DESC
LIMIT 20;

-- Result (top 8, as of Aug 2026):
-- javascript   2,426,570
-- python       2,026,601
-- java         1,866,055
-- c#           1,559,381
-- php          1,445,727
-- android      1,386,427
-- html         1,146,211
-- jquery       ~1,029,000
--
-- Note: this is a cumulative historical total (2008-2022), not a trend.
-- It does not indicate whether a technology is growing or declining over
-- time -- only its overall volume across the full date range. The next
-- step is to break this down by year to identify actual trends.
