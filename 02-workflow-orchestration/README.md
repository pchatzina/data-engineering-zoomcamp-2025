# SQL Queries

## Question 3
```sql
SELECT COUNT(*) 
FROM `dtc_de_course_448810_ny_taxi_dataset.yellow_tripdata`
WHERE filename LIKE 'yellow_tripdata_2020-%';
```

## Question 4
```sql
SELECT COUNT(*) 
FROM `dtc_de_course_448810_ny_taxi_dataset.green_tripdata`
WHERE filename LIKE 'green_tripdata_2020-%';
```

## Question 5
```sql
SELECT COUNT(*) 
FROM `dtc_de_course_448810_ny_taxi_dataset.yellow_tripdata`
WHERE filename = 'yellow_tripdata_2021-03.csv';
```