#!/bin/bash

rm stage_data/*
rmdir stage_data

hdfs dfs -rm hospitals.csv /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -rm effective_care.csv /user/w205/hospital_compare/effective_care/effective_care.csv
hdfs dfs -rm readmissions.csv /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm measures.csv /user/w205/hospital_compare/measures/measures.csv
hdfs dfs -rm survey_responses.csv /user/w205/hospital_compare/survey_responses/survey_responses.csv

hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/measures
hdfs dfs -rmdir /user/w205/hospital_compare/survey_responses

hdfs dfs -rmdir /user/w205/hospital_compare
