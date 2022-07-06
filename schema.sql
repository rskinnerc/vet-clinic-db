/* Database schema to keep the structure of entire database. */

/* Project 1 */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

/* Project 2 */
ALTER TABLE animals
ADD species VARCHAR(255);

/* Project 3 */
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INT
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255)
);

ALTER TABLE species
ADD UNIQUE(id);

ALTER TABLE owners
ADD UNIQUE(id);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

/* Project 4 */
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

