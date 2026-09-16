INSERT INTO HIS_WING (wing_id, wing_name)
VALUES (1, 'Cardiology');

INSERT INTO HIS_WING (wing_id, wing_name)
VALUES (2, 'Pulmonology');

ALTER TABLE HIS_WARD
DISABLE CONSTRAINT fk_ward_supervisor;

INSERT INTO HIS_WARD (ward_number, wing_id, nurse_id)
VALUES (101, 1, 1001);

INSERT INTO HIS_WARD (ward_number, wing_id, nurse_id)
VALUES (201, 2, 1002);

INSERT INTO HIS_NURSE
(nurse_id, first_name, last_name, ssn, date_of_birth,
 street, street_number, city, postal_code, ward_number)
VALUES
(1001, 'Eleni', 'Georgiou', '000-01-0002', DATE '1991-11-18',
 'Ermou Street', '55', 'Athens', '10563', 101);

INSERT INTO HIS_NURSE
(nurse_id, first_name, last_name, ssn, date_of_birth,
 street, street_number, city, postal_code, ward_number)
VALUES
(1002, 'Dimitris', 'Papadopoulos', '000-02-0003', DATE '1983-05-14',
 'Panepistimiou Street', '208', 'Athens', '10677', 201);

ALTER TABLE HIS_WARD
ENABLE CONSTRAINT fk_ward_supervisor;

INSERT INTO HIS_NURSE_PHONE (nurse_id, phone_number)
VALUES (1001, '6911111111');

INSERT INTO HIS_NURSE_PHONE (nurse_id, phone_number)
VALUES (1002, '6922222222');

INSERT INTO HIS_MEDICAL_CONSULTANT
(consultant_id, first_name, last_name, ssn,
 street, street_number, city, postal_code, specialty)
VALUES
(2001, 'George', 'Nikolaou', '000-03-0004',
 'Patision Street', '120', 'Athens', '11257', 'Cardiology');

INSERT INTO HIS_MEDICAL_CONSULTANT
(consultant_id, first_name, last_name, ssn,
 street, street_number, city, postal_code, specialty)
VALUES
(2002, 'Anna', 'Konstantinou', '000-04-0005',
 'Alexandras Avenue', '75', 'Athens', '11474', 'Pulmonology');

 INSERT INTO HIS_MEDICAL_CONSULTANT_PHONE
(consultant_id, phone_number)
VALUES (2001, '6933333333');

INSERT INTO HIS_MEDICAL_CONSULTANT_PHONE
(consultant_id, phone_number)
VALUES (2002, '6944444444');

INSERT INTO HIS_PATIENT
(patient_id, first_name, last_name, ssn,
 street, street_number, city, postal_code,
 admission_date, discharge_date, ward_number, consultant_id)
VALUES
(3001, 'Maria', 'Ioannou', '000-05-0006',
 'Acharnon Street', '45', 'Athens', '10439',
 DATE '2026-09-10', NULL, 101, 2001);

INSERT INTO HIS_PATIENT
(patient_id, first_name, last_name, ssn,
 street, street_number, city, postal_code,
 admission_date, discharge_date, ward_number, consultant_id)
VALUES
(3002, 'Kostas', 'Dimitriou', '000-06-0007',
 'Kifisias Avenue', '90', 'Athens', '11526',
 DATE '2026-09-08', DATE '2026-09-14', 201, 2002);

INSERT INTO HIS_PATIENT_PHONE
(patient_id, phone_number)
VALUES (3001, '6955555555');

INSERT INTO HIS_PATIENT_PHONE
(patient_id, phone_number)
VALUES (3002, '6966666666');

INSERT INTO HIS_PRESCRIPTION
(prescription_id, patient_id)
VALUES (4001, 3001);

INSERT INTO HIS_PRESCRIPTION
(prescription_id, patient_id)
VALUES (4002, 3002);

INSERT INTO HIS_DRUG
(drug_id, drug_name, recommended_daily_dosage)
VALUES (5001, 'Aspirin', 100);

INSERT INTO HIS_DRUG
(drug_id, drug_name, recommended_daily_dosage)
VALUES (5002, 'Paracetamol', 500);

INSERT INTO HIS_PRESCRIPTION_DRUG
(prescription_id, drug_id, quantity, daily_dosage)
VALUES (4001, 5001, 20, 100);

INSERT INTO HIS_PRESCRIPTION_DRUG
(prescription_id, drug_id, quantity, daily_dosage)
VALUES (4002, 5002, 10, 250);
