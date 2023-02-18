DROP DATABASE IF EXISTS medical_db;

CREATE DATABASE medical_db;

\c medical_db;



CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true, --employment_status TEXT NOT NULL, -- 'active' OR 'inactive'
    start_date DATE NOT NULL, -- yyyy-mm-dd
    end_date DATE
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true, --patient_status TEXT NOT NULL, -- 'current' or 'former'
    primary_doctor_id INTEGER REFERENCES doctors,
    initial_appt DATE NOT NULL,
    most_recent_appt DATE NOT NULL,
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    appt_date DATE NOT NULL,
    new_diagnosis BOOLEAN DEFAULT false
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    disease_id INTEGER REFERENCES diseases,
    visit_id INTEGER REFERENCES visits,
    doctor_id INTEGER REFERENCES doctors
);