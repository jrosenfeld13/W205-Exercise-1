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
