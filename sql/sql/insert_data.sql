-- Contoh data dummy

INSERT INTO dim_companies (name) VALUES ('PT Artha Solutions'), ('PT Data Insight');
INSERT INTO dim_areas (name) VALUES ('Jakarta'), ('Bandung');
INSERT INTO dim_positions (name) VALUES ('Data Analyst'), ('Business Analyst');
INSERT INTO dim_departments (name) VALUES ('Analytics'), ('Technology');
INSERT INTO dim_divisions (name) VALUES ('Digital Banking'), ('Risk Management');
INSERT INTO dim_directorates (name) VALUES ('IT Directorate'), ('Finance Directorate');
INSERT INTO dim_grades (name) VALUES ('Junior'), ('Senior');
INSERT INTO dim_education (name) VALUES ('S1 Informatika'), ('S1 Statistik');
INSERT INTO dim_majors (name) VALUES ('Computer Science'), ('Statistics');
INSERT INTO dim_competency_pillars (pillar_code, pillar_label)
VALUES ('C01', 'Cognitive'), ('B01', 'Behavioral');

INSERT INTO employees (employee_id, fullname, nik_baru, company_id, area_id, position_id, department_id, division_id, directorate_id, grade_id, education_id, major_id, years_of_service_months)
VALUES 
('E001', 'Andi Saputra', '123', 1, 1, 1, 1, 1, 1, 1, 1, 1, 36),
('E002', 'Rina Lestari', '124', 1, 2, 2, 2, 2, 2, 2, 2, 2, 12);
