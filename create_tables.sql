CREATE TABLE HIS_WING (
    wing_id NUMBER(5) CONSTRAINT pk_wing PRIMARY KEY,
    wing_name VARCHAR2(50) NOT NULL
);

CREATE TABLE HIS_WARD (
    ward_number NUMBER(5) CONSTRAINT pk_ward PRIMARY KEY,
    wing_id NUMBER(5) NOT NULL,
    nurse_id NUMBER(5) NOT NULL,
    
    CONSTRAINT fk_ward_wing
        FOREIGN KEY (wing_id)
        REFERENCES HIS_WING(wing_id),
        
    CONSTRAINT uk_ward_supervisor
        UNIQUE (nurse_id)
);

CREATE TABLE HIS_NURSE (
    nurse_id NUMBER(5) CONSTRAINT pk_nurse PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    ssn VARCHAR2(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    street VARCHAR2(50) NOT NULL,
    street_number VARCHAR2(10) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    postal_code VARCHAR2(10) NOT NULL,
    ward_number NUMBER(5) NOT NULL,

    CONSTRAINT uk_nurse_ssn
        UNIQUE (ssn),

    CONSTRAINT fk_nurse_ward
        FOREIGN KEY (ward_number)
        REFERENCES HIS_WARD(ward_number)
);

ALTER TABLE HIS_WARD
ADD CONSTRAINT fk_ward_supervisor
    FOREIGN KEY (nurse_id)
    REFERENCES HIS_NURSE(nurse_id);

CREATE TABLE HIS_NURSE_PHONE (
    nurse_id NUMBER(5) NOT NULL,
    phone_number VARCHAR2(20) NOT NULL,

    CONSTRAINT pk_nurse_phone
        PRIMARY KEY (nurse_id, phone_number),

    CONSTRAINT fk_nurse_phone_nurse
        FOREIGN KEY (nurse_id)
        REFERENCES HIS_NURSE(nurse_id)
);

CREATE TABLE HIS_MEDICAL_CONSULTANT (
    consultant_id NUMBER(5) CONSTRAINT pk_consultant PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    ssn VARCHAR2(20) NOT NULL,
    street VARCHAR2(50) NOT NULL,
    street_number VARCHAR2(10) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    postal_code VARCHAR2(10) NOT NULL,
    specialty VARCHAR2(50) NOT NULL,

    CONSTRAINT uk_consultant_ssn
        UNIQUE (ssn)
);

CREATE TABLE HIS_MEDICAL_CONSULTANT_PHONE (
    consultant_id NUMBER(5) NOT NULL,
    phone_number VARCHAR2(20) NOT NULL,

    CONSTRAINT pk_consultant_phone
        PRIMARY KEY (consultant_id, phone_number),

    CONSTRAINT fk_consultant_phone
        FOREIGN KEY (consultant_id)
        REFERENCES HIS_MEDICAL_CONSULTANT(consultant_id)
);

CREATE TABLE HIS_PATIENT (
    patient_id NUMBER(5) CONSTRAINT pk_patient PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    ssn VARCHAR2(20) NOT NULL,
    street VARCHAR2(50) NOT NULL,
    street_number VARCHAR2(10) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    postal_code VARCHAR2(10) NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE,
    ward_number NUMBER(5) NOT NULL,
    consultant_id NUMBER(5) NOT NULL,

    CONSTRAINT uk_patient_ssn
        UNIQUE (ssn),

    CONSTRAINT fk_patient_ward
        FOREIGN KEY (ward_number)
        REFERENCES HIS_WARD(ward_number),

    CONSTRAINT fk_patient_consultant
        FOREIGN KEY (consultant_id)
        REFERENCES HIS_MEDICAL_CONSULTANT(consultant_id),

    CONSTRAINT chk_patient_dates
        CHECK (discharge_date IS NULL OR discharge_date >= admission_date)
);

CREATE TABLE HIS_PATIENT_PHONE (
    patient_id NUMBER(5) NOT NULL,
    phone_number VARCHAR2(20) NOT NULL,

    CONSTRAINT pk_patient_phone
        PRIMARY KEY (patient_id, phone_number),

    CONSTRAINT fk_patient_phone
        FOREIGN KEY (patient_id)
        REFERENCES HIS_PATIENT(patient_id)
);

CREATE TABLE HIS_PRESCRIPTION (
    prescription_id NUMBER(5) CONSTRAINT pk_prescription PRIMARY KEY,
    patient_id NUMBER(5) NOT NULL,

    CONSTRAINT fk_prescription_patient
        FOREIGN KEY (patient_id)
        REFERENCES HIS_PATIENT(patient_id)
);

CREATE TABLE HIS_DRUG (
    drug_id NUMBER(5) CONSTRAINT pk_drug PRIMARY KEY,
    drug_name VARCHAR2(50) NOT NULL,
    recommended_daily_dosage NUMBER(5,2) NOT NULL,

    CONSTRAINT chk_drug_dosage
        CHECK (recommended_daily_dosage > 0)
);

CREATE TABLE HIS_PRESCRIPTION_DRUG (
    prescription_id NUMBER(5) NOT NULL,
    drug_id NUMBER(5) NOT NULL,
    quantity NUMBER(5) NOT NULL,
    daily_dosage NUMBER(5,2) NOT NULL,

    CONSTRAINT pk_prescription_drug
        PRIMARY KEY (prescription_id, drug_id),

    CONSTRAINT fk_prescdrug_prescription
        FOREIGN KEY (prescription_id)
        REFERENCES HIS_PRESCRIPTION(prescription_id),

    CONSTRAINT fk_prescdrug_drug
        FOREIGN KEY (drug_id)
        REFERENCES HIS_DRUG(drug_id),

    CONSTRAINT chk_prescdrug_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_prescdrug_dosage
        CHECK (daily_dosage > 0)
);
