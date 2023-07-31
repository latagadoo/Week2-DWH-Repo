SELECT date,
 AVG(precipitation) OVER seven_days as avg_precp,
 MIN(precipitation) OVER seven_days as min_precp,
 MAX(precipitation) OVER seven_days as max_precp,
 SUM(precipitation) OVER seven_days as sum_precp,
 AVG(snow_fall) OVER seven_days as avg_snow,
 MIN(snow_fall) OVER seven_days as min_snow,
 MAX(snow_fall) OVER seven_days as max_snow,
 SUM(snow_fall) OVER seven_days as sum_snow

FROM {{ ref('stg__central_park_weather') }}
WINDOW seven_days AS (
 ORDER BY date ASC
 RANGE BETWEEN INTERVAL 3 DAYS PRECEDING AND
 INTERVAL 3 DAYS FOLLOWING)

--  calculate the 7 day moving average precipitation for every day in 
-- the weather data. 
-- some days have zero precipitation, that would result in average being zero as thats not being handled.
	


