
-- pivot trips by by borough



{% set boroughs = ['Manhattan', 'Queens', 'Bronx', 'Brooklyn', 'Staten Island', 'EWR', 'Unknown'] %}

SELECT
  {% for borough in boroughs %}
    SUM(CASE WHEN borough = '{{ borough }}' THEN trips ELSE 0 END) AS "{{ borough }}"{% if not loop.last %},{% endif %}
  {% endfor %}
FROM {{ ref('mart__fact_trips_by_borough') }};
