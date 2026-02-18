## (most) Querries used

```sql

CREATE OR REPLACE EXTERNAL TABLE `data-eng-zoomcamp-485022.NYtaxiDatasetCh3Pratice.YellowtaxiExternal`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://nytaxibucket/*.parquet']
);


CREATE OR REPLACE TABLE `data-eng-zoomcamp-485022.NYtaxiDatasetCh3Pratice.Yellowtaxi`
AS
SELECT * FROM `project.dataset.external_taxi_data`;

SELECT COUNT(*) FROM `NYtaxiDatasetCh3Pratice.YellowtaxiExternal`;

SELECT PULocationID, DOLocationID FROM `NYtaxiDatasetCh3Pratice.Yellowtaxi`;

SELECT COUNT(*) FROM `NYtaxiDatasetCh3Pratice.YellowtaxiExternal` GROUP BY PULocationID

SELECT COUNT(*) FROM `NYtaxiDatasetCh3Pratice.YellowtaxiExternal` WHERE fare_amount = 0;

CREATE OR REPLACE TABLE `NYtaxiDatasetCh3Pratice.YellowTaxiPartition`
PARTITION BY DATE(tpep_pickup_datetime)
CLUSTER BY VendorId
AS 
SELECT * FROM `NYtaxiDatasetCh3Pratice.YellowtaxiExternal`;

SELECT DISTINCT VendorId FROM `NYtaxiDatasetCh3Pratice.YellowTaxiPartition` WHERE tpep_pickup_datetime BETWEEN '2024-03-01' AND '2024-03-15';
SELECT DISTINCT VendorId FROM `NYtaxiDatasetCh3Pratice.YellowTaxi` WHERE tpep_pickup_datetime BETWEEN '2024-03-01' AND '2024-03-15';
```