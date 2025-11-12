-- Talent Match Algorithm

WITH tv_calc AS (
    SELECT 
        s.employee_id,
        e.fullname,
        tv.pillar_code,
        tv.pillar_label AS tv_name,
        b.role_name,
        b.job_level,
        b.weights_config,
        80 AS baseline_score,
        s.score AS user_score,
        LEAST(s.score::DECIMAL / 80, 1) AS tv_match_rate
    FROM competencies_yearly s
    JOIN employees e ON e.employee_id = s.employee_id
    JOIN dim_competency_pillars tv ON tv.pillar_code = s.pillar_code
    JOIN talent_benchmarks b ON TRUE
),

tgv_calc AS (
    SELECT 
        employee_id,
        AVG(tv_match_rate) AS tgv_match_rate
    FROM tv_calc
    GROUP BY employee_id
),

final_calc AS (
    SELECT
        employee_id,
        AVG(tgv_match_rate) AS final_match_rate
    FROM tgv_calc
    GROUP BY employee_id
)

SELECT 
    tv.employee_id,
    tv.fullname,
    tv.role_name,
    tv.tv_name,
    tv.baseline_score,
    tv.user_score,
    ROUND(tv.tv_match_rate * 100, 2) AS tv_match_rate_percent,
    ROUND(tgv.tgv_match_rate * 100, 2) AS tgv_match_rate_percent,
    ROUND(f.final_match_rate * 100, 2) AS final_match_rate_percent
FROM tv_calc tv
JOIN tgv_calc tgv ON tgv.employee_id = tv.employee_id
JOIN final_calc f ON f.employee_id = tv.employee_id
ORDER BY tv.employee_id;
