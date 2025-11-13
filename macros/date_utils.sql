{% macro GET_SEASON(x) %}
CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2) THEN 'Winter'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5) THEN 'Spring'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8) THEN 'Summer'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (9,10,11) THEN 'Fall' END
{% endmacro %}

{% macro GET_ACTUALDATE(x) %}
CASE WHEN DATE(TO_TIMESTAMP({{x}})) < DATE(CURRENT_DATE) THEN 'PAST'
    WHEN DATE(TO_TIMESTAMP({{x}})) = DATE(CURRENT_DATE) THEN 'PAST'
    WHEN DATE(TO_TIMESTAMP({{x}})) > DATE(CURRENT_DATE) THEN 'PAST' END
{% endmacro %}

{% macro GET_DAYTYPE(x) %}
CASE WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
        THEN 'Weekend'
        ELSE 'Weekday' END
{% endmacro %}