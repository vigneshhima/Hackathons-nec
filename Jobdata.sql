CREATE DATABASE Jobdata;

-- Step 2: Select the Database
USE Jobdata;
CREATE TABLE regions (
    region_id VARCHAR(10) PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

INSERT INTO regions (region_id, region_name, last_updated_by) VALUES
('EU', 'Europe', 'system'),
('NA', 'North America', 'system');
CREATE TABLE countries (
    country_cd VARCHAR(10) PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    region_id VARCHAR(10) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    FOREIGN KEY (region_id) REFERENCES regions (region_id)
);

-- Example insert statements for countries
INSERT INTO countries (country_cd, country_name, region_id, last_updated_by) VALUES
('US', 'United States', 'NA', 'system'),
('CA', 'Canada', 'NA', 'system'),
('DE', 'Germany', 'EU', 'system'),
('FR', 'France', 'EU', 'system');
CREATE TABLE departments (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

-- Example insert statements for departments
INSERT INTO departments (dept_id, dept_name, last_updated_by) VALUES
('HR', 'Human Resources', 'system'),
('IT', 'Information Technology', 'system'),
('SALES', 'Sales', 'system');
CREATE TABLE job_types (
    job_type_cd VARCHAR(10) PRIMARY KEY,
    job_type_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

-- Example insert statements for job types
INSERT INTO job_types (job_type_cd, job_type_name, last_updated_by) VALUES
('ITM', 'IT Manager', 'system'),
('HRM', 'HR Manager', 'system'),
('DEV', 'Developer', 'system'),
('HRA', 'HR Assistant', 'system'),
('SM', 'Sales Manager', 'system');
CREATE TABLE job_status_codes (
    job_status_cd VARCHAR(10) PRIMARY KEY,
    status_desc VARCHAR(50) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

-- Example insert statements for job status codes
INSERT INTO job_status_codes (job_status_cd, status_desc, last_updated_by) VALUES
('OPEN', 'Open', 'system'),
('CLOSED', 'Closed', 'system'),
('PENDING', 'Pending', 'system');
CREATE TABLE appl_status_codes (
    appl_status_cd VARCHAR(10) PRIMARY KEY,
    status_desc VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

-- Example insert statements for applicant status codes
INSERT INTO appl_status_codes (appl_status_cd, status_desc, last_updated_by) VALUES
('PENDING', 'Pending', 'system'),
('REJECTED', 'Rejected', 'system'),
('PASSED_TEST', 'Passed Written Test', 'system'),
('PASSED_INT1', 'Passed Interview 1', 'system'),
('SHORTLISTED', 'Short Listed', 'system'),
('SELECTED', 'Selected', 'system');
CREATE TABLE edu_levels (
    edu_level_cd VARCHAR(10) PRIMARY KEY,
    edu_level_name VARCHAR(50) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

-- Example insert statements for education levels
INSERT INTO edu_levels (edu_level_cd, edu_level_name, last_updated_by) VALUES
('HS', 'High School', 'system'),
('GRAD', 'Graduate', 'system'),
('POSTGRAD', 'Post Graduate', 'system'),
('PHD', 'Doctorate/PhD', 'system');
CREATE TABLE edu_types (
    edu_type_cd VARCHAR(10) PRIMARY KEY,
    edu_type_name VARCHAR(100) NOT NULL,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50)
);

-- Example insert statements for education types
INSERT INTO edu_types (edu_type_cd, edu_type_name, last_updated_by) VALUES
('CE', 'Civil Engineering', 'system'),
('CSE', 'Computer Engineering', 'system'),
('BA', 'Business Administration', 'system'),
('ECO', 'Economics', 'system'),
('GEN', 'General', 'system');
CREATE SEQUENCE job_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE jobs (
    job_id BIGINT PRIMARY KEY,
    job_title VARCHAR(200) NOT NULL,
    job_desc VARCHAR(4000),
    job_type_cd VARCHAR(10) NOT NULL,
    dept_id VARCHAR(10) NOT NULL,
    job_status_cd VARCHAR(10) NOT NULL,
    country_cd VARCHAR(10) NOT NULL,
    date_opened DATE,
    date_closed DATE,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    FOREIGN KEY (job_type_cd) REFERENCES job_types (job_type_cd),
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id),
    FOREIGN KEY (job_status_cd) REFERENCES job_status_codes (job_status_cd),
    FOREIGN KEY (country_cd) REFERENCES countries (country_cd)
);

-- Example insert statement for a job
INSERT INTO jobs (job_id, job_title, job_desc, job_type_cd, dept_id, job_status_cd, country_cd, date_opened, last_updated_by) VALUES
(job_seq.NEXTVAL, 'Senior Developer', 'Responsible for developing and maintaining software applications', 'DEV', 'IT', 'OPEN', 'US', SYSDATE, 'admin');
CREATE CALL appl_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE applicants (
    app_id BLOB PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_num VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20),
    country_cd VARCHAR(10) NOT NULL,
    appl_status_cd VARCHAR(10) NOT NULL,
    edu_lev_cd VARCHAR(10) NOT NULL,
    edu_type_cd VARCHAR(10) NOT NULL,
    resume_file_name VARCHAR(200),
    cover_letter_text VARCHAR(4000),
    date_applied DATE,
    employed_flag CHAR(1),
    current_employer_name VARCHAR(100),
    year_of_exp BLOB,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    FOREIGN KEY (country_cd) REFERENCES countries (country_cd),
    FOREIGN KEY (appl_status_cd) REFERENCES appl_status_codes (appl_status_cd),
    FOREIGN KEY (edu_lev_cd) REFERENCES edu_levels (edu_level_cd),
    FOREIGN KEY (edu_type_cd) REFERENCES edu_types (edu_type_cd)
);

-- Example insert statement for an applicant
INSERT INTO applicants (app_id, first_name, last_name, email, country_cd, appl_status_cd, edu_lev_cd, edu_type_cd, date_applied, employed_flag, last_updated_by) VALUES
(appl_seq.NEXTVAL, 'John', 'Doe', 'john.doe@example.com', 'US', 'PENDING', 'GRAD', 'CSE', SYSDATE, 'N', 'admin');
CREATE TABLE applicants_jobs (
    app_id BIGINT,
    job_id bigint,
    appl_status_cd VARCHAR(10),
    date_applied DATE,
    written_test_date DATE,
    interview1_date DATE,
    interview2_date DATE,
    last_update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_by VARCHAR(50),
    PRIMARY KEY (app_id, job_id),
    FOREIGN KEY (app_id) REFERENCES applicants (app_id),
    FOREIGN KEY (job_id) REFERENCES jobs (job_id),
    FOREIGN KEY (appl_status_cd) REFERENCES appl_status_codes (appl_status_cd)
);

-- Example insert statement for applicants_jobs
INSERT INTO applicants_jobs (app_id, job_id, appl_status_cd, date_applied, last_updated_by) VALUES
(1, 1, 'PENDING', SYSDATE, 'admin');
show tables;
