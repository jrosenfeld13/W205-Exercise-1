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
