create table patients (
    id int GENERATED ALWAYS AS IDENTITY,
    name VARCHAR (500),
    date_of_birth date,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id INT,
    status varchar(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(id)
);