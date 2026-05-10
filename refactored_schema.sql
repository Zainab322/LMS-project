USE healthbridge_hospital;

DROP TABLE IF EXISTS patient_phones;
DROP TABLE IF EXISTS appointments_refactored;
DROP TABLE IF EXISTS billing_refactored;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors_refactored;
DROP TABLE IF EXISTS departments_refactored;
DROP TABLE IF EXISTS appt_status_ref;

CREATE TABLE departments_refactored (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(255) NOT NULL,
    hod VARCHAR(255),
    budget DECIMAL(12,2)
);

CREATE TABLE doctors_refactored (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    speciality VARCHAR(255),
    contact_no VARCHAR(255),
    join_date DATE,
    salary_monthly DECIMAL(12,2),
    department_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (department_id)
    REFERENCES departments_refactored(department_id)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    dob DATE,
    gender VARCHAR(20),
    addr1 VARCHAR(255),
    addr2 VARCHAR(255),
    city VARCHAR(255),
    registered_doctor_id INT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (registered_doctor_id)
    REFERENCES doctors_refactored(doctor_id)
);

CREATE TABLE patient_phones (
    phone_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    phone_number VARCHAR(30),
    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id)
);

CREATE TABLE appt_status_ref (
    status_code CHAR(1) PRIMARY KEY,
    description VARCHAR(50)
);

INSERT INTO appt_status_ref VALUES
('P', 'Pending'),
('C', 'Completed'),
('X', 'Cancelled'),
('H', 'On Hold'),
('R', 'Rescheduled');

CREATE TABLE appointments_refactored (
    appt_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    doc_id INT NOT NULL,
    appt_datetime DATETIME NOT NULL,
    status CHAR(1) NOT NULL,
    fee DECIMAL(10,2),
    discount DECIMAL(10,2),
    room_number INT,
    building_block VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),
    FOREIGN KEY (status)
    REFERENCES appt_status_ref(status_code)
);

CREATE TABLE billing_refactored (
    bill_no VARCHAR(50) PRIMARY KEY,
    patient_id INT NOT NULL,
    services TEXT,
    svc_cost DECIMAL(10,2),
    tax_pct DECIMAL(5,2),
    paid DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id)
);