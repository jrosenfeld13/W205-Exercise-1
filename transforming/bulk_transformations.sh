#!bin/bash

hive -f measures_transform.sql
hive -f effective_care_transform.sql
hive -f survey_responses_transform.sql
hive -f hospitals_transform.sql
hive -f measures_transform.sql
