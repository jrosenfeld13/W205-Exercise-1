from pyspark.sql.functions import *
from pyspark.sql.window import Window

#load in data
hive_context = HiveContext(sc)
effective_care_spark = hive_context.table("effective_care_transform")
readmissions_spark = hive_context.table("readmissions_transform")

#only count hospitals with a large enough sample size and number of measures counted
effective_filtered = effective_care_spark.filter("sample > 50")
measure_counts = effective_filtered.groupBy('provider_id').agg({"measure_id":"count"}).where(col('count(measure_id)') > 12)
effective_filtered = effective_filtered.join(measure_counts, effective_filtered.provider_id == measure_counts.provider_id, 'right').drop(measure_counts.provider_id)

readmissions_filtered = readmissions_spark.filter("denominator > 100")
measure_counts_r = readmissions_filtered.groupBy('provider_id').agg({"measure_id":"count"}).where(col('count(measure_id)') > 12)
readmissions_filtered = readmissions_filtered.join(measure_counts_r, readmissions_filtered.provider_id == measure_counts_r.provider_id, 'right').drop(measure_counts_r.provider_id)

## create two different data frames including only measures to be maximized or minimized
effective_filtered_min = effective_filtered.where("measure_id not like 'IMM%' and measure_id not like 'OP_23' and measure_id not like 'OP_29' and measure_id not like 'OP_30' and measure_id not like 'OP_31' and measure_id not like 'STK_4' and measure_id not like 'VTE_5'")
effective_filtered_max = effective_filtered.where("measure_id not like 'ED%' and measure_id not like 'OP_1' and measure_id not like 'OP_3b' and measure_id not like 'OP_5' and measure_id not like 'OP_22' and measure_id not like 'OP_18b' and measure_id not like 'PC_01' and measure_id not like 'VTE_6'")

##rank min scores for effective care
ranked_min = effective_filtered_min.withColumn("rank", denseRank().over(Window.partitionBy('measure_id').orderBy("score")))
##rank max scores for effective care
ranked_max = effective_filtered_max.withColumn("rank", denseRank().over(Window.partitionBy('measure_id').orderBy(desc("score"))))
##rank min scores for readmissions
ranked_readmissions = readmissions_filtered.withColumn("rank", denseRank().over(Window.partitionBy('measure_id').orderBy("score")))


##combine max and min ranked dataframes and find the average rank
ranked_effective = ranked_max.unionAll(ranked_min)
ranked_effective = ranked_effective.select('hospital_name','state','measure_id','measure_name','score','provider_id','rank') #filter columns that are shared with readmissions data
ranked_readmissions = ranked_readmissions.select('hospital_name','state','measure_id','measure_name','score','provider_id','rank') #filter columns that are shared with effective_care data
ranked_combine = ranked_effective.unionAll(ranked_readmissions)
ranked_combine = ranked_combine.groupBy(["provider_id","hospital_name"]).agg({"rank":"mean","measure_id":"count"}).orderBy("avg(rank)")
ranked_combine.where(col('count(measure_id)') > 16).show(10)
