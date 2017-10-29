DROP TABLE readmissions_transform;

CREATE TABLE readmissions_transform AS
SELECT
  provider_id,
  hospital_name,
  state,
  measure_name,
  measure_id,
  compared_to_national,
  cast(denominator AS INT) as denominator,
  cast(score AS INT) as score,
  cast(lower_estimate AS INT) as lower_estimate,
  cast(higher_estimate AS INT) as higher_estimate
FROM readmissions
WHERE score NOT LIKE 'Not%';
