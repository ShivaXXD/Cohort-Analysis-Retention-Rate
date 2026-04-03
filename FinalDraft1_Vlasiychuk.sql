WITH users_clean AS (
    SELECT 
        user_id, 
        promo_signup_flag,
        CASE 
            WHEN LENGTH(SPLIT_PART(REPLACE(REPLACE(TRIM(SPLIT_PART(signup_datetime, ' ', 1)), '.', '-'), '/', '-'), '-', 3)) = 4 
            THEN TO_DATE(REPLACE(REPLACE(TRIM(SPLIT_PART(signup_datetime, ' ', 1)), '.', '-'), '/', '-'), 'DD-MM-YYYY')
            ELSE TO_DATE(REPLACE(REPLACE(TRIM(SPLIT_PART(signup_datetime, ' ', 1)), '.', '-'), '/', '-'), 'DD-MM-YY')
        END AS signup_date
    FROM cohort_users_raw
),
events_clean AS (
    SELECT 
        user_id,
        CASE 
            WHEN LENGTH(SPLIT_PART(REPLACE(REPLACE(TRIM(SPLIT_PART(event_datetime, ' ', 1)), '.', '-'), '/', '-'), '-', 3)) = 4 
            THEN TO_DATE(REPLACE(REPLACE(TRIM(SPLIT_PART(event_datetime, ' ', 1)), '.', '-'), '/', '-'), 'DD-MM-YYYY')
            ELSE TO_DATE(REPLACE(REPLACE(TRIM(SPLIT_PART(event_datetime, ' ', 1)), '.', '-'), '/', '-'), 'DD-MM-YY')
        END AS event_date
    FROM cohort_events_raw
    WHERE event_type IS NOT NULL AND event_type != 'test_event'
),
joined_metrics AS (
    SELECT 
        u.user_id,
        u.promo_signup_flag,
        DATE_TRUNC('month', u.signup_date)::DATE AS cohort_month,
        DATE_TRUNC('month', e.event_date)::DATE AS activity_month,
        EXTRACT(MONTH FROM AGE(DATE_TRUNC('month', e.event_date), DATE_TRUNC('month', u.signup_date))) AS month_offset
    FROM users_clean u
    JOIN events_clean e ON u.user_id = e.user_id
    WHERE u.signup_date IS NOT NULL AND e.event_date IS NOT NULL
)
SELECT 
    promo_signup_flag,
    cohort_month,
    month_offset,
    COUNT(DISTINCT user_id) AS users_total
FROM joined_metrics
WHERE activity_month BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3;