DROP TABLE survey_responses_transform;

CREATE TABLE survey_responses_transform AS
SELECT
  provider_id,
  hospital_name,
  state,

  cast(split(communication_nurse_achievement_points, ' out of ')[0] as INT)/cast(split(communication_nurse_achievement_points, 'out of ')[1] as INT) AS comm_nurse_achievement,
  cast(split(communication_nurse_improvement_points, ' out of ')[0] as INT)/cast(split(communication_nurse_improvement_points, 'out of ')[1] as INT) AS comm_nurse_improvement,
  cast(split(communication_nurse_dimension_score, ' out of ')[0] as INT)/cast(split(communication_nurse_dimension_score, 'out of ')[1] as INT) AS comm_nurse_dimension,

  cast(split(communication_doc_achievement_points, ' out of ')[0] as INT)/cast(split(communication_doc_achievement_points, 'out of ')[1] as INT) AS comm_doc_achievement,
  cast(split(communication_doc_improvement_points, ' out of ')[0] as INT)/cast(split(communication_doc_improvement_points, 'out of ')[1] as INT) AS comm_doc_improvement,
  cast(split(communication_doc_dimension_score, ' out of ')[0] as INT)/cast(split(communication_doc_dimension_score, 'out of ')[1] as INT) AS comm_doc_dimension,

  cast(split(responsiveness_of_staff_achievement_points, ' out of ')[0] as INT)/cast(split(responsiveness_of_staff_achievement_points, 'out of ')[1] as INT) AS response_staff_achievement,
  cast(split(responsiveness_of_staff_improvement_points, ' out of ')[0] as INT)/cast(split(responsiveness_of_staff_improvement_points, 'out of ')[1] as INT) AS response_staff_improvement,
  cast(split(responsiveness_of_staff_dimension_score, ' out of ')[0] as INT)/cast(split(responsiveness_of_staff_dimension_score, 'out of ')[1] as INT) AS response_staff_dimension,

  cast(split(pain_management_achievement_points, ' out of ')[0] as INT)/cast(split(pain_management_achievement_points, 'out of ')[1] as INT) AS pain_achievement,
  cast(split(pain_management_improvement_points, ' out of ')[0] as INT)/cast(split(pain_management_improvement_points, 'out of ')[1] as INT) AS pain_improvement,
  cast(split(pain_management_dimension_score, ' out of ')[0] as INT)/cast(split(pain_management_dimension_score, 'out of ')[1] as INT) AS pain_dimension,

  cast(split(communication_achievement_points, ' out of ')[0] as INT)/cast(split(communication_achievement_points, 'out of ')[1] as INT) AS comm_achievement,
  cast(split(communication_improvement_points, ' out of ')[0] as INT)/cast(split(communication_improvement_points, 'out of ')[1] as INT) AS comm_improvement,
  cast(split(communication_dimension_score, ' out of ')[0] as INT)/cast(split(communication_dimension_score, 'out of ')[1] as INT) AS comm_dimension,

  cast(split(cleanliness_achievement_points, ' out of ')[0] as INT)/cast(split(cleanliness_achievement_points, 'out of ')[1] as INT) AS cleanliness_achievement,
  cast(split(cleanliness_improvement_points, ' out of ')[0] as INT)/cast(split(cleanliness_improvement_points, 'out of ')[1] as INT) AS cleanliness_improvement,
  cast(split(cleanliness_dimension_score, ' out of ')[0] as INT)/cast(split(cleanliness_dimension_score, 'out of ')[1] as INT) AS cleanliness_dimension,

  cast(split(discharge_achievement_points, ' out of ')[0] as INT)/cast(split(discharge_achievement_points, 'out of ')[1] as INT) AS discharge_achievement,
  cast(split(discharge_improvement_points, ' out of ')[0] as INT)/cast(split(discharge_improvement_points, 'out of ')[1] as INT) AS discharge_improvement,
  cast(split(discharge_dimension_score, ' out of ')[0] as INT)/cast(split(discharge_dimension_score, 'out of ')[1] as INT) AS discharge_dimension,

  cast(split(overall_achievement_points, ' out of ')[0] as INT)/cast(split(overall_achievement_points, 'out of ')[1] as INT) AS overall_achievement,
  cast(split(overall_improvement_points, ' out of ')[0] as INT)/cast(split(overall_improvement_points, 'out of ')[1] as INT) AS overall_improvement,
  cast(split(overall_dimension_score, ' out of ')[0] as INT)/cast(split(overall_dimension_score, 'out of ')[1] as INT) AS overall_dimension,

  cast(hcahps_base_score AS INT) AS base_score,
  cast(hcahps_consistency_score AS INT) AS consistency_score
FROM survey_responses
WHERE hcahps_base_score NOT LIKE 'Not%';
