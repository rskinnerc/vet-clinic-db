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

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    type VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY (id)
);

create table medical_histories_treatment(
    treatment_id int,
    medical_history_id int,
    CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

create table invoice_items(
    id int PRIMARY key GENERATED ALWAYS AS IDENTITY UNIQUE,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);