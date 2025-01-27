# SQL Queries

## Question 3
```sql
SELECT COUNT(*) AS trips_up_to_1_mile
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00'
AND lpep_dropoff_datetime < '2019-11-01 00:00:00'
AND trip_distance <= 1;

SELECT COUNT(*) AS trips_between_1_and_3_miles
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00'
AND lpep_dropoff_datetime < '2019-11-01 00:00:00'
AND trip_distance > 1
AND trip_distance <= 3

SELECT COUNT(*) AS trips_between_3_and_7_miles
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00'
AND lpep_dropoff_datetime < '2019-11-01 00:00:00'
AND trip_distance > 3
AND trip_distance <= 7;

SELECT COUNT(*) AS trips_between_7_and_10_miles
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00'
AND lpep_dropoff_datetime < '2019-11-01 00:00:00'
AND trip_distance > 7
AND trip_distance <= 10;

SELECT COUNT(*) AS trips_over_10_miles
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00'
AND lpep_dropoff_datetime < '2019-11-01 00:00:00'
AND trip_distance > 10;
```

## Question 4
```sql
SELECT DATE(lpep_pickup_datetime) AS pickup_day,
MAX(trip_distance) AS longest_trip_distance
FROM green_taxi_trips
GROUP BY DATE(lpep_pickup_datetime)
ORDER BY longest_trip_distance DESC
LIMIT 1;
```

## Question 5
```sql
SELECT tz."Zone" AS pickup_zone,
SUM(gt.total_amount) AS total_revenue
FROM green_taxi_trips gt
JOIN taxi_zones tz
ON gt."PULocationID" = tz."LocationID"
WHERE DATE(gt.lpep_pickup_datetime) = '2019-10-18'
GROUP BY tz."Zone"
HAVING SUM(gt.total_amount) > 13000
ORDER BY total_revenue DESC
LIMIT 3;
```

## Question 6
```sql
SELECT tz_drop."Zone" AS dropoff_zone,
MAX(gt.tip_amount) AS largest_tip
FROM green_taxi_trips gt
JOIN taxi_zones tz_pick ON gt."PULocationID" = tz_pick."LocationID"
JOIN taxi_zones tz_drop ON gt."DOLocationID" = tz_drop."LocationID"
WHERE tz_pick."Zone" = 'East Harlem North' 
AND DATE(gt.lpep_pickup_datetime) BETWEEN '2019-10-01' AND '2019-10-31'
GROUP BY tz_drop."Zone"
ORDER BY largest_tip DESC
LIMIT 1;
```