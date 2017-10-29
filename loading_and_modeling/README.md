## Loading and modeling
Pull in the data from data.medicare.gov, erase the first line of each file that we want, and move the files into hdfs. Lastly, write DDL SQL statements for each file with the included "hive_base_ddl.sql".
```
cd W205-Exercise-1/loading_and_modeling/
chmod +rwx load_data_lake.sh
./load_data_lake.sh
hive -f hive_base_ddl.sql
```

Note: "CLEAN_load_data_lake.sh" is also included to help cleanup between runs or test runs, but is not necessary.
