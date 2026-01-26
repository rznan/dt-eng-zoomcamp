-- Question 3
select count(1) from green_trip_data where lpep_pickup_datetime >= '2025-11-01' and lpep_pickup_datetime < '2025-12-01' and trip_distance <= 1;

-- Question 4
select date_part('day', lpep_pickup_datetime) as lpep_day,  max(trip_distance) from green_trip_data where trip_distance < 100 group by lpep_day ORDER BY lpep_day;

-- Question 5
SELECT 
    t2."Zone",
    SUM(t1.total_amount) as total
FROM
    green_trip_data t1
INNER JOIN
    taxi_zone_lookup t2
    ON t1."PULocationID" = t2."LocationID"
WHERE 
    lpep_pickup_datetime::date = '2025-11-18' 
GROUP BY 
    t2."Zone" 
ORDER BY total DESC;

-- Question 6
SELECT 
    t2."Zone" as "DOZone",
    max(tip_amount) as Tip
FROM
    green_trip_data t1
INNER JOIN
    taxi_zone_lookup t2
    ON t1."DOLocationID" = t2."LocationID"
WHERE 
    t1."PULocationID" IN (
            SELECT 
                "LocationID" 
            FROM taxi_zone_lookup 
            WHERE "Zone" = 'East Harlem North')
GROUP BY 
    t2."Zone" 
ORDER BY Tip DESC;