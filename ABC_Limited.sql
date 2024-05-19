create database ABC_Limited;
USE ABC_Limited;
CREATE TABLE regions (region_id INT PRIMARY KEY,region_name VARCHAR(50));
CREATE TABLE countries (country_cd VARCHAR(2) PRIMARY KEY,country_name VARCHAR(50),region_id INT,FOREIGN KEY (region_id) REFERENCES regions(region_id));
CREATE TABLE departments (dept_id INT PRIMARY KEY,dept_name VARCHAR(50));
CREATE TABLE job_type (job_type_cd VARCHAR(10) PRIMARY KEY,job_type_name VARCHAR(50));
CREATE TABLE job_status_codes (job_status_cd VARCHAR(10) PRIMARY KEY,status_desc VARCHAR(50));
CREATE TABLE appl_status_codes (appl_status_cd VARCHAR(10) PRIMARY KEY,status_desc VARCHAR(50));

CREATE TABLE education_levels (edu_level_cd VARCHAR(10) PRIMARY KEY,edu_level_name VARCHAR(50));
CREATE TABLE education_type (edu_type_cd VARCHAR(10) PRIMARY KEY,edu_type_name VARCHAR(50));


CREATE TABLE applicants (appl_id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(100),phone_num VARCHAR(15),address VARCHAR(255),city VARCHAR(50),state VARCHAR(50),zip VARCHAR(10),country_cd VARCHAR(2),appl_status_cd VARCHAR(10),edu_level_cd VARCHAR(10),edu_type_cd VARCHAR(10),resume_file_name VARCHAR(255),cover_letter_text TEXT,date_applied DATE,employed_flag BOOLEAN,current_employer_name VARCHAR(100),years_of_exp INT,last_update_date TIMESTAMP,last_updated_by VARCHAR(50));
  
CREATE TABLE applicant_jobs (appl_id INT,job_id INT,appl_status_cd VARCHAR(10),date_applied DATE,written_test_date DATE,interview1_data TEXT,interview2_data TEXT,PRIMARY KEY (appl_id, job_id),last_update_date TIMESTAMP,last_updated_by VARCHAR(50));
 SHOW CREATE TABLE countries;
 show table status ;