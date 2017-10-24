DROP TABLE measures_transform;

CREATE TABLE measures_transform AS
SELECT
  measure_name,
  measure_id,
  cast(
    concat(
      substr(measure_start_date, 7, 4),'-',
      substr(measure_start_date, 1, 2),'-',
      substr(measure_start_date, 4, 2)
    ) AS DATE
  ) AS start_date,
  cast(
    concat(
      substr(measure_end_date, 7, 4),'-',
      substr(measure_end_date, 1, 2),'-',
      substr(measure_end_date, 4, 2)
    ) AS DATE
  ) AS end_date
FROM measures;
