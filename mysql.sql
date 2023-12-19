use hospital_portal;

CREATE TABLE doctors (
    doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR(45) NOT NULL,
    specialization VARCHAR(45) NOT NULL
);

CREATE TABLE patients (
    patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    admission_date DATE,
    discharge_date DATE
);
insert into patients (patient_name, age, admission_date, discharge_date)
      values ( "umar", 16, "2023-10-15", "2023-01-25"), ("Kofi", 25, "2023-09-16", "2023-10-20"), ("Salman", 18, "2023-04-19", "2023-04-25");
      select * from patients;

CREATE TABLE appointments (
    appointment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,  # Change the data type here
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
Delimiter //
CREATE PROCEDURE AppointmentBuilder(IN pat_id INT, IN doc_id INT, IN app_date DATE, IN app_time DECIMAL(5,2))
BEGIN
    INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time)
    VALUES (pat_id, doc_id, app_date, app_time);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DischargePatient(IN pat_id INT, IN dis_date DATE)
BEGIN
    UPDATE Patients
    SET discharge_date = dis_date
    WHERE patient_id = pat_id;
END //

DELIMITER ;

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255)
    
);

Insert into Doctors (name, specialization, phone_number, email)
VALUES 
('Dr. Hussein Abdulahi', 'Cardiologist', '123-456-7890', 'hussein234@gmail,com'),
('Dr. Harrisa Basiru', 'Pediatrician', '987-654-3210', 'reesa1@gmail.com'),
('Dr. Aisha Muftau', 'Dermatologist', '555-123-7890', 'Aish345@gmai.cpm.com');

CREATE VIEW DoctorAppointmentsPatients AS
SELECT 
	d.doctor_id,
    d.doctor_name,
    d.doctor_ specialization,
    a.appointment_date,
    a.appointment_id,
    p.patient_id,
    p.patient_name
 

FROM 
    Appointments A
JOIN 
    Doctors D ON A.doctor_id = D.doctor_id
JOIN 
    Patients P ON A.patient_id = P.patient_id;

SELECT * FROM DoctorAppointmentsPatients;

delete from patients where patient_id > 3;