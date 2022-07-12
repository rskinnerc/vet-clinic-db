create table patients (
    id int GENERATED ALWAYS AS IDENTITY,
    name VARCHAR (500),
    date_of_birth date,
    PRIMARY KEY (id)
);
