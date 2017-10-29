SELECT measure_id, measure_name, STDDEV(score) AS score_sd
FROM effective_care_transform
WHERE sample > 100
GROUP BY measure_id, measure_name
ORDER BY score_sd DESC
LIMIT 10;
