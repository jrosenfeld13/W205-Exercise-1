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

Note: "CLEAN_load_data_lake.sh" is also included to help cleanup between runs or test runs, but is not necessary.

## Transforming
Call each transformation to prepare data for further investigation:
```
cd ../transforming
chmod a+rwx bulk_transformations.sh
./bulk_transformations.sh
```
"bulk_transformation.sh" calls each individual SQL transformation.

Alternatively, load spark-sql or hive-cli and run each SQL transformation individually:
```
source effective_care_transform.sql
source hospitals_transform.sql
source measures_transform.sql
source readmissions_transform.sql
source survey_responses_transform.sql
```

The transformations result in data tables following the entity-relationship diagram:
![ER Diagram](/loading_and_modeling/ER-diagram.png)

## Investigating
Ensure spark components are exported into your PATH.
```
cd ../investigations
```
- **What hospitals are models of high-quality care (which hospitals have the most consistently high scores for a variety of procedures)?**

  Run the following [code](/investigations/best_hospitals/best_hospitals.py) for best hospital output:
```
./pyspark best_hospitals.py
```
[Hospital results/output](/investigations/best_states/best_states.txt)
- **What states are models of high-quality care?**

  Run the following [code](/investigations/best_states/best_states.py) for best state output:
```
./pyspark best_states.py
```
[State results/output](/investigations/best_states/best_states.txt)
- **Which procedures have the greatest variability between hospitals?**

  Run the following [code](/investigations/hospital_variability/hospital_variability.sql) for procedure variability output:
```
./spark-sql hospital_variability.sql
```
[Variability results/output](/investigations/hospital_variability/hospital_variability.txt)
- **Are average scores for hospital quality or procedural variability correlated with patient survey responses?**

  Run the following [code](/investigations/hospitals_and_patients/hospitals_and_patients.py) for correlation outputs:
```
./pyspark hospitals_and_patients.py
```
[Correlation results/output](/investigations/hospitals_and_patients/hospitals_and_patients.txt)

#### Investigation notes
An investigation of the [data dictionary](/DDB_Data_Dictionary.pdf), specifically with regards to our effective_care data table, indicates that some measures should be minimized (e.g. ED-1b average time patients spent in the emergency department, PC-01 percent of mothers whose deliveries were scheduled too early when unnecessary) while other measures clearly should be maximized to account for "high quality" care (e.g. OP-29 percentage of patients receiving appropriate recommendation for follow-up screening colonoscopy). We do not have similar problems in our readmissions data table where all measures should  be minimized (with some attention paid to the denominator/sample).

After conducting a full sweep of the measures in effective_care, the following is a summary of measures that are both important and should be maximized or minimized in order to qualify for "quality care:"

##### effective_care measures of quality direction

| minimize | maximize |
|:--------:|----------|
| ED-1b | IMM-2 |
| ED-2b | IMM-3 |
| EDV | OP-23 |
| OP-1 | OP-29 |
| OP-3b | OP-30 |
| OP-5 | OP-31 |
| OP-22 | STK-4 |
| PC-01 | VTE-5 |
| VTE-6 |  |

The largest complications arise from the fact that hospital sizes vary by orders of magnitude and the number of measures recorded by hospitals can also drastically differ. Further issues arise from mismatches between measure scores taken in "effective_care" and "readmissions." In order to ensure fair rankings, we can only look at hospitals with a sufficient sample size and number of measures recorded in each data table. This has the effect of filtering out smaller hospitals, leaving us only ranking large hospitals.

Next steps should include considerations to weigh various procedures or complications differently rather than ranking them evenly and averaging.
