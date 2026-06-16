create database diabetes_analysis;
use diabetes_analysis;

-- Creating and Importing tables
CREATE TABLE diabetes(
id int,
encounter_id BIGINT,
patient_nbr float,
race VARCHAR(50),
gender VARCHAR(20),
age VARCHAR(20),
weight varchar(20),
admission_type_id int,
discharge_disposition_id int,
admission_source_id int,
time_in_hospital int,
payer_code varchar(20),
medical_specialty varchar(50),
num_lab_procedures int,
num_procedures int,
num_medications int,
number_outpatient int,
number_emergency int,
number_inpatient int,
diag_1 varchar(50),
diag_2 varchar(50),
diag_3 varchar(50),
number_diagnoses int,
max_glu_serum varchar(50),
A1Cresult varchar(50),
metformin varchar(50),
repaglinide varchar(50),
nateglinide varchar(50),
chlorpropamide varchar(50),
glimepiride varchar(50),
acetohexamide varchar(50),
glipizide varchar(50),
glyburide varchar(50),
tolbutamide varchar(50),
pioglitazone varchar(50),
rosiglitazone varchar(50),
acarbose varchar(50),
miglitol varchar(50),
troglitazone varchar(50),
tolazamide varchar(50),
examide varchar(50),
citoglipton varchar(50),
insulin varchar(50),
glyburide_metformin varchar(50),
glipizide_metformin varchar(50),
glimepiride_pioglitazone varchar(50),
metformin_rosiglitazone varchar(50),
metformin_pioglitazone varchar(50),
Change_D varchar(50),
diabetesMed varchar(50),
readmitted varchar(50),
Age_Category varchar(50)
);

-- all the data imported from python jupyter notebook
select * from diabetes;

-- QUERIES : 

-- 1) Total patients 
select Count(*) as patients
from diabetes;

-- 2) Gender Distribution
select gender, count(*) as Patients
from diabetes 
group by gender;

-- 3) Readmission Distribution
select readmitted, count(*) as patients
from diabetes 
group by readmitted;

-- 4) Average Stay in Hospitals
select avg(time_in_hospital)
from diabetes;

-- 5) Top Age group
select age, count(*) as patients
from diabetes 
group by age
order by patients desc;

-- 6) Readmission by gender
select readmitted, gender, count(*) as patients
from diabetes 
group by gender, readmitted;

-- 7) Readmission by age 
select age, count(*) patients 
from diabetes 
where readmitted <> 'NO'
group by age;

-- 8) Patients with Most Medications
select patient_nbr, num_medications
from diabetes 
order by num_medications desc
limit 10;

-- 9) Longest Hospital stay
select *
from diabetes 
order by time_in_hospital desc
limit 10;

-- 10) Readmission Rate 
select 
round( sum( case when readmitted <> 'NO' then 1 else 0 END) * 100.0/count(*) ,2 ) as readmission
from diabetes;

