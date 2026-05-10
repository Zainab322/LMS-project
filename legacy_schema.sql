
```sql
CREATE DATABASE IF NOT EXISTS healthbridge_hospital;

USE healthbridge_hospital;

DROP TABLE IF EXISTS pat_master;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS billing;
DROP TABLE IF EXISTS departments;

CREATE TABLE pat_master (
    pid INT PRIMARY KEY,
    p_name VARCHAR(255),
    dob VARCHAR(50),
    sex CHAR(1),
    ph1 VARCHAR(255),
    ph2 VARCHAR(255),
    ph3 VARCHAR(255),
    addr1 VARCHAR(255),
    addr2 VARCHAR(255),
    city VARCHAR(255),
    reg_doc VARCHAR(255),
    reg_doc_id VARCHAR(255),
    total_visits INT,
    last_bill FLOAT,
    notes TEXT
);

CREATE TABLE appointments (
    appt_id INT PRIMARY KEY,
    patient_id INT,
    patient_nm VARCHAR(255),
    patient_ph VARCHAR(255),
    doc_id INT,
    doc_name VARCHAR(255),
    appt_date VARCHAR(50),
    status CHAR(1),
    fee FLOAT,
    discount FLOAT,
    net_fee FLOAT,
    room VARCHAR(255)
);

CREATE TABLE doctors (
    DoctorID INT PRIMARY KEY,
    FullName VARCHAR(255),
    Speciality VARCHAR(255),
    ContactNo VARCHAR(255),
    JoinDt VARCHAR(50),
    Salary FLOAT,
    dept_id INT,
    isActive CHAR(1)
);

CREATE TABLE billing (
    bill_no VARCHAR(50) PRIMARY KEY,
    pid INT,
    pname VARCHAR(255),
    services TEXT,
    svc_cost FLOAT,
    tax_pct FLOAT,
    tax_amt FLOAT,
    grand_total FLOAT,
    paid FLOAT,
    balance FLOAT,
    created VARCHAR(50),
    created_by VARCHAR(255)
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_nm VARCHAR(255),
    hod VARCHAR(255),
    budget FLOAT
);