#!/bin/bash

##Download data and unzip files into the data subfolder
mkdir data
cd data
wget -O flat_files.zip https://data.medicare.gov/views/bg9k-emty/files/4a66c672-a92a-4ced-82a2-033c28581a90?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip &&
unzip flat_files.zip

##Strip the first line of all of our necessary files, rename them, and move them to the parent directory
tail -n +2 "Hospital General Information.csv" > ../hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > ../effective_care.csv
tail -n +2 "Complications and Deaths - Hospital.csv" > ../readmissions.csv
tail -n +2 "Measure Dates.csv" > ../measures.csv
tail -n +2 "hvbp_hcahps_11_10_2016.csv" > ../survey_responses.csv

##Make hadoop directory and fill it with csv files
hdfs dfs -mkdir /user/w205/hopsital_compare

hdfs dfs -put ../hospitals.csv /user/w205/hopsital_compare
hdfs dfs -put ../effective_care.csv /user/w205/hopsital_compare
hdfs dfs -put ../readmissions.csv /user/w205/hopsital_compare
hdfs dfs -put ../measures.csv /user/w205/hopsital_compare
hdfs dfs -put ../survey_responses.csv /user/w205/hopsital_compare
