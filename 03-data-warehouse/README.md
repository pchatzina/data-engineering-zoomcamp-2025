# SQL Queries

## Create external table
```sql
CREATE OR REPLACE EXTERNAL TABLE `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://dtc_de_course_448810_ny_taxi_bucket/yellow_tripdata_*.parquet']
);
```

## Create materialized table
```sql
CREATE OR REPLACE TABLE `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned` AS
SELECT * FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips`;
```

## Question 1
```sql
SELECT COUNT(*) FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips`;
```

## Question 2
The first part of the union will read 0MB and the second part 155.12MB
```sql
SELECT 
  COUNT(DISTINCT PULocationID) AS distinct_pu_location_count,
  'external_table' AS table_type
FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips`
UNION ALL
SELECT 
  COUNT(DISTINCT PULocationID) AS distinct_pu_location_count,
  'native_table' AS table_type
FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned`;
```

## Question 3
```sql
SELECT PULocationID 
FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned`;
```
```sql
SELECT PULocationID, DOLocationID 
FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned`;
```

## Question 4
```sql
SELECT COUNT(*) FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned`
WHERE fare_amount = 0.0
```

## Question 5
```sql
CREATE OR REPLACE TABLE `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_partitioned`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS
SELECT * FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned`;
```

## Question 6
```sql
SELECT DISTINCT(VendorID)
FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_nonpartitioned`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-16';
```
```sql
SELECT DISTINCT(VendorID)
FROM `dtc-de-course-448810.dtc_de_course_448810_ny_taxi_dataset.yellow_taxi_trips_partitioned`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-16';
```