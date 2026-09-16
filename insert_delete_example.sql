INSERT INTO HIS_PATIENT
(patient_id, first_name, last_name, ssn,
 street, street_number, city, postal_code,
 admission_date, discharge_date, ward_number, consultant_id)
VALUES
(3003, 'Nikos', 'Andreou', '000-07-0008',
 'Solonos Street', '40', 'Athens', '10672',
 DATE '2026-09-15', NULL, 101, 2001);

DELETE FROM HIS_PATIENT
WHERE patient_id = 3003;
