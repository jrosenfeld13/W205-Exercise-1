DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county_name string,
  phone_number string,
  hospital_type string,
  hospital_ownership string,
  emergency_services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';



DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county_name string,
  phone_number string,
  condition string,
  measure_id string,
  measure_name string,
  score string,
  sample string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';




DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county_name string,
  phone_number string,
  measure_name string,
  measure_id string,
  compared_to_national string,
  denominator string,
  score string,
  lower_estimate string,
  higher_estimate string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';



DROP TABLE measures;
CREATE EXTERNAL TABLE measures
(
  measure_name string,
  measure_id string,
  measure_start_quarter string,
  measure_start_date string,
  measure_end_quarter string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';



DROP TABLE survey_responses;
CREATE EXTERNAL TABLE survey_responses
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county_name string,
  communication_nurse_floor string,
  communication_nurse_achievement_threshhold string,
  communication_nurse_benchmark string,
  communication_nurse_baseline_rate string,
  communication_nurse_performance_rate string,
  communication_nurse_achievement_points string,
  communication_nurse_improvement_points string,
  communication_nurse_dimension_score string,
  communication_doc_floor string,
  communication_doc_achievement_threshhold string,
  communication_doc_benchmark string,
  communication_doc_baseline_rate string,
  communication_doc_performance_rate string,
  communication_doc_achievement_points string,
  communication_doc_improvement_points string,
  communication_doc_dimension_score string,
  responsiveness_of_staff_floor string,
  responsiveness_of_staff_achievement_threshhold string,
  responsiveness_of_staff_benchmark string,
  responsiveness_of_staff_baseline_rate string,
  responsiveness_of_staff_performance_rate string,
  responsiveness_of_staff_achievement_points string,
  responsiveness_of_staff_improvement_points string,
  responsiveness_of_staff_dimension_score string,
  pain_management_floor string,
  pain_management_achievement_threshhold string,
  pain_management_benchmark string,
  pain_management_baseline_rate string,
  pain_management_performance_rate string,
  pain_management_achievement_points string,
  pain_management_improvement_points string,
  pain_management_dimension_score string,
  communication_floor string,
  communication_achievement_threshhold string,
  communication_benchmark string,
  communication_baseline_rate string,
  communication_performance_rate string,
  communication_achievement_points string,
  communication_improvement_points string,
  communication_dimension_score string,
  cleanliness_floor string,
  cleanliness_achievement_threshhold string,
  cleanliness_benchmark string,
  cleanliness_baseline_rate string,
  cleanliness_performance_rate string,
  cleanliness_achievement_points string,
  cleanliness_improvement_points string,
  cleanliness_dimension_score string,
  discharge_floor string,
  discharge_achievement_threshhold string,
  discharge_benchmark string,
  discharge_baseline_rate string,
  discharge_performance_rate string,
  discharge_achievement_points string,
  discharge_improvement_points string,
  discharge_dimension_score string,
  overall_floor string,
  overall_achievement_threshhold string,
  overall_benchmark string,
  overall_baseline_rate string,
  overall_performance_rate string,
  overall_achievement_points string,
  overall_improvement_points string,
  overall_dimension_score string,
  hcahps_base_score string,
  hcahps_consistency_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';
