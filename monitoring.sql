
-- Creates and selects the database
CREATE DATABASE IF NOT EXISTS community_monitoring;
USE community_monitoring;

-- Optional cleanup for re-runs
DROP TABLE IF EXISTS InterviewServices, Interviews, YouthServices, DataCapturers, Patients, Facilities, SubRegions, Districts, Provinces;

-- Provinces
CREATE TABLE Provinces (
    province_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Districts
CREATE TABLE Districts (
    district_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES Provinces(province_id)
);

-- SubRegions
CREATE TABLE SubRegions (
    subregion_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district_id INT NOT NULL,
    FOREIGN KEY (district_id) REFERENCES Districts(district_id)
);

-- Facilities
CREATE TABLE Facilities (
    facility_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    subregion_id INT NOT NULL,
    FOREIGN KEY (subregion_id) REFERENCES SubRegions(subregion_id)
);

-- Patients
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    age INT NOT NULL CHECK (age >= 0)
);

-- Data Capturers Table
CREATE TABLE DataCapturers (
    capturer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    contact VARCHAR(20)
);

-- Youth Services
CREATE TABLE YouthServices (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL UNIQUE
);

-- Interviews
CREATE TABLE Interviews (
    interview_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    facility_id INT NOT NULL,
    capturer_id INT NOT NULL,
    interview_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (facility_id) REFERENCES Facilities(facility_id),
    FOREIGN KEY (capturer_id) REFERENCES DataCapturers(capturer_id)
);

-- Many-to-Many Relationship: InterviewServices Table
CREATE TABLE InterviewServices (
    interview_id INT,
    service_id INT,
    PRIMARY KEY (interview_id, service_id),
    FOREIGN KEY (interview_id) REFERENCES Interviews(interview_id),
    FOREIGN KEY (service_id) REFERENCES YouthServices(service_id)
);

-- Sample Data Insertion

-- Provinces
INSERT INTO Provinces (name) VALUES ('Gauteng'), ('KwaZulu-Natal');

-- Districts
INSERT INTO Districts (name, province_id) VALUES 
('Johannesburg', 1), 
('Durban', 2);

-- SubRegions
INSERT INTO SubRegions (name, district_id) VALUES 
('South SubRegion', 1), 
('North SubRegion', 2);

-- Facilities
INSERT INTO Facilities (name, subregion_id) VALUES 
('Hillbrow Clinic', 1), 
('Umlazi Clinic', 2);

-- Patients
INSERT INTO Patients (gender, age) VALUES 
('Male', 22), 
('Female', 19);

-- Data Capturers
INSERT INTO DataCapturers (full_name, contact) VALUES 
('Thabo Mokoena', '0812345678'), 
('Ayanda Sithole', '0723456789');

-- Youth Services
INSERT INTO YouthServices (service_name) VALUES 
('HIV Testing'), 
('Mental Health'), 
('Sexual Reproductive Health');

-- Interviews
INSERT INTO Interviews (patient_id, facility_id, capturer_id, interview_date)
VALUES 
(1, 1, 1, '2025-05-01'), 
(2, 2, 2, '2025-05-02');

-- Interview Services Mapping
INSERT INTO InterviewServices (interview_id, service_id)
VALUES 
(1, 1), 
(1, 2), 
(2, 2), 
(2, 3);
