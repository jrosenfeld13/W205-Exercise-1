#!/bin/bash

rm stage_data/*
rmdir stage_data

hdfs dfs -rm user/w205/hospital_compare/hospitals.csv
hdfs dfs -rm /user/w205/hopsital_compare/effective_care.csv
hdfs dfs -rm /user/w205/hopsital_compare/readmissions.csv
hdfs dfs -rm /user/w205/hopsital_compare/measures.csv
hdfs dfs -rm /user/w205/hopsital_compare/survey_responses.csv

hdfs dfs -rmdir /user/w205/hopsital_compare
