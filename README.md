# cmu-95797-23m6
Week5
Added the queries. txt files contain individualual query results. Sincence text files displayed some special characters, I have also added word doc that contains screenshot of different queries.

Week 4
Added SQL in Analysis folder and screenshots in word doc under Answers for Week 4 for the following SQLs

bike_trips_and_duration_by_weekday.sql - count & total time of bikes trips by weekday
taxi_trips_ending_at_airport.sql - total number of trips ending in service_zones 'Airports' or 'EWR'
inter_borough_taxi_trips_by_weekday.sql (hard!): by weekday, 
count of total trips, trips starting and ending in a different borough, and 
percentage w/ different start/end


Week 3
Added tests in sources and staging, updated staging sql to clean base_number field of spaces and nulls and convert to upper case

Week 23
Steps:
1. Activated python virtual env to enable dbt use
2 Initialized dbt project
3. Added connection profile in profiles.yml
4. Edited dbt_project.yml to update configuration information.
5. Added get_custom_schema.sql in nyc_transit/macros directory to enable pretty schema names in duckdb
6. Installed version 0.10.0 in packages.yml
7. dbt run-operation to include data types and column description. Updated schema name to main
8. Added sources.yml in models directory
9. Added sql files for staging model in staging subdirectory under models , one file for each table, names beginning with stg__. Updated the column names, data types, merged some columns to unify schemas, removed few columns with no data and trip duration is being calculated by start time and end time so removed that column too.
10. Look at main.db .tables to ensure staging tables got created.