CREATE TABLE patients(
    patient_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    date_of_birth DATE,
    contact_number VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    insurance_provider VARCHAR(50),
    insurance_number VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE doctors(
    doctor_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    specialization VARCHAR(30) NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    years_experience INT,
    hospital_branch VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE appointments(
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    doctor_id VARCHAR(10) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason_for_visit VARCHAR(100),
    status VARCHAR(20),

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);


CREATE TABLE treatments(
    treatment_id VARCHAR(20) PRIMARY KEY,
    appointment_id VARCHAR(10) NOT NULL,
    treatment_type VARCHAR(40) NOT NULL,
    description VARCHAR(100),
    cost DECIMAL(10,2),
    treatment_date DATE,

    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);


CREATE TABLE billing(
    bill_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    treatment_id VARCHAR(20) NOT NULL,
    bill_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);
