# cmu-95797-23m6
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