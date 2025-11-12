-- CREATE TABLES berdasarkan ERD

CREATE TABLE dim_companies (
    company_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_areas (
    area_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_positions (
    position_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_departments (
    department_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_divisions (
    division_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_directorates (
    directorate_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_grades (
    grade_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_education (
    education_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_majors (
    major_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE dim_competency_pillars (
    pillar_code VARCHAR(3) PRIMARY KEY,
    pillar_label TEXT
);

CREATE TABLE employees (
    employee_id TEXT PRIMARY KEY,
    fullname TEXT,
    nik_baru TEXT,
    company_id INT REFERENCES dim_companies(company_id),
    area_id INT REFERENCES dim_areas(area_id),
    position_id INT REFERENCES dim_positions(position_id),
    department_id INT REFERENCES dim_departments(department_id),
    division_id INT REFERENCES dim_divisions(division_id),
    directorate_id INT REFERENCES dim_directorates(directorate_id),
    grade_id INT REFERENCES dim_grades(grade_id),
    education_id INT REFERENCES dim_education(education_id),
    major_id INT REFERENCES dim_majors(major_id),
    years_of_service_months INT
);

CREATE TABLE profiles_psych (
    employee_id TEXT PRIMARY KEY REFERENCES employees(employee_id),
    pauli NUMERIC,
    faxtor NUMERIC,
    disc TEXT,
    first_char TEXT,
    second_char TEXT,
    first_word TEXT,
    second_word TEXT,
    disc_word TEXT,
    enneagram INT,
    mbti TEXT,
    iq NUMERIC,
    gtq1 INT,
    gtq2 INT,
    gtq3 INT,
    gtq4 INT,
    gtq5 INT,
    gtq_total INT,
    tiki1 INT,
    tiki2 INT,
    tiki3 INT,
    tiki4 INT
);

CREATE TABLE papi_scores (
    employee_id TEXT REFERENCES employees(employee_id),
    scale_code TEXT,
    score INT,
    PRIMARY KEY (employee_id, scale_code)
);

CREATE TABLE strengths (
    employee_id TEXT REFERENCES employees(employee_id),
    rank INT,
    theme TEXT,
    PRIMARY KEY (employee_id, rank)
);

CREATE TABLE performance_yearly (
    employee_id TEXT REFERENCES employees(employee_id),
    year INT,
    rating INT,
    PRIMARY KEY (employee_id, year)
);

CREATE TABLE competencies_yearly (
    employee_id TEXT REFERENCES employees(employee_id),
    pillar_code VARCHAR(3) REFERENCES dim_competency_pillars(pillar_code),
    year INT,
    score INT,
    PRIMARY KEY (employee_id, pillar_code, year)
);

CREATE TABLE employee_archetypes (
    employee_id TEXT REFERENCES employees(employee_id),
    archetype_code TEXT,
    PRIMARY KEY (employee_id, archetype_code)
);

CREATE TABLE talent_benchmarks (
    job_vacancy_id SERIAL PRIMARY KEY,
    role_name TEXT,
    job_level TEXT,
    role_purpose TEXT,
    selected_talent_ids TEXT,
    weights_config JSONB
);
