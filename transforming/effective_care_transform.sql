DROP TABLE effective_care_transform;

CREATE TABLE effective_care_transform AS
SELECT
  provider_id,
  hospital_name,
  state,
  condition,
  measure_id,
  measure_name,
  cast(score AS INT),
  cast(sample AS INT)
FROM effective_care;
