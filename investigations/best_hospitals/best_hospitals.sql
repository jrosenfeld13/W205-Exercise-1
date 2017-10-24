select state, avg(consistency_score) from survey_responses_transform group by state order by avg(consistency_score) desc;
