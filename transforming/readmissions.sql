DROP TABLE readmissions_transform;

CREATE TABLE readmissions_transform AS
SELECT
  provider_id,
  hospital_name,
  state,
  measure_name,
  measure_id,
  compared_to_national,
  cast(denominator AS INT),
  cast(score AS INT),
  cast(lower_estimate AS INT),
  cast(higher_estimate AS INT)
FROM readmissions;
