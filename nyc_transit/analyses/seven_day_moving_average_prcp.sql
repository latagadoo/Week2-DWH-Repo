SELECT date,
  avg(precipitation) OVER seven_days as avg_precp
FROM {{ ref('stg__central_park_weather') }}
WINDOW seven_days AS (
 ORDER BY date ASC
 RANGE BETWEEN INTERVAL 3 DAYS PRECEDING AND
 INTERVAL 3 DAYS FOLLOWING)

--  calculate the 7 day moving average precipitation for every day in 
-- the weather data. 
-- some days have zero precipitation, that would result in average being zero as thats not being handled.
	


