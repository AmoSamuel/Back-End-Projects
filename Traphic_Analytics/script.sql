SELECT pg_size_pretty(
  pg_table_size('sensors.observations')
);

SELECT pg_size_pretty(
     pg_total_relation_size('sensors.observations_location_id_datetime_idx')
) as idx_size;

SELECT pg_size_pretty(
     pg_total_relation_size('sensors.observations_pkey')
) as primary_key_idx;


SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;


UPDATE sensors.observations 
SET distance = (distance * 3.281) 
WHERE TRUE;

--checking size of table after update
SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;


VACUUM sensors.observations;

SELECT pg_size_pretty(
  pg_table_size('sensors.observations')
);

--adding additional data to the database
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;


SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;

VACUUM FULL sensors.observations;
 
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;


DELETE from sensors.observations 
WHERE location_id > 24;

TRUNCATE sensors.observations;

\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './original_obs_types.csv' WITH DELIMITER ',' CSV HEADER;
 
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;
