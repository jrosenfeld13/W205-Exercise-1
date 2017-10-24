# W205-Exercise-1

## Setup
If running an AWS UCB AMI, ensure your environment is setup correctly:
```
mount -t ext4 /dev/xvdf /data
./start-hadoop.sh
/data/start_postgres.sh
```

Clone the repo in your desired location:
```
git clone https://github.com/jrosenfeld13/W205-Exercise-1.git
```

## Loading and modeling
Pull in the data from data.medicare.gov, erase the first line of each file that we want, and move the files into hdfs. Lastly, write DDL SQL statements for each file with the included "hive_base_ddl.sql".
```
cd W205-Exercise-1/loading_and_modeling/
chmod +rwx load_data_lake.sh
./load_data_lake.sh
hive -f hive_base_ddl.sql
```

Note: "CLEAN_load_data_lake.sh" is also included to help cleanup between runs or test runs, but is not necessary

## Transforming
Call each transformation to prepare data for further investigation:
```
hive -f bulk_transform.sh
```
"bulk_transformation.sh" calls each individual SQL transformation which can also be run individually.

Alternatively, use spark-sql or hive-cli and run:
```
source effective_care_transform.sql
source hospitals_transform.sql
source measures_transform.sql
source readmissions_transform.sql
source survey_responses_transform.sql
```

The resulting transformations result in data following the entity-relationship diagram:
![ER Diagram](/loading_and_modeling/ER-diagram.png)

## Investigating
