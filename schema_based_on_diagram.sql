create table patients (
    id int GENERATED ALWAYS AS IDENTITY,
    name VARCHAR (500),
    date_of_birth date,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    admitted_at timestamp,
    patient_id INT,
    status varchar(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(id),

);

create table invoices (
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    PRIMARY KEY (id),
    CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);