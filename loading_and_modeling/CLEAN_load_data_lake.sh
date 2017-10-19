#!/bin/bash

rm stage_data/*
rmdir stage_data

hdfs dfs -rm /hospitals.csv /user/w205/hopsital_compare
hdfs dfs -rm /effective_care.csv /user/w205/hopsital_compare
hdfs dfs -rm /readmissions.csv /user/w205/hopsital_compare
hdfs dfs -rm /measures.csv /user/w205/hopsital_compare
hdfs dfs -rm /survey_responses.csv /user/w205/hopsital_compare

hdfs dfs -rmdir /user/w205/hopsital_compare
