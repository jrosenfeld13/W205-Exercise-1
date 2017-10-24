DROP TABLE hospitals_transform;

CREATE TABLE hospitals_transform AS
SELECT
  provider_id,
  hospital_name,
  state,
  hospital_type,
  hospital_ownership,
  emergency_services
FROM hospitals;
