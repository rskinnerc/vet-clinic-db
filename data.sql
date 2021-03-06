/* Populate database with sample data. */

/* Project 1 */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

/* Project 2 */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Charmander', 'Feb 8, 2020', 0, false, -11),
('Plantmon', 'Nov 15, 2021', 2, true, -5.7),
('Squirtle', 'Apr 2, 1993', 3, false, -12.13),
('Angemon', 'Jun 12, 2005', 1, true, -45),
('Boarmon', 'Jun 7, 2005', 7, true, 20.4),
('Blossom', 'Oct 13, 1998', 3, true, 17),
('Ditto', 'May 14, 2022', 4, true, 22);


BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT TRANSACTION;
SELECT * FROM animals;

BEGIN TRANSACTION;

DELETE FROM animals;
SELECT * FROM animals;

ROLLBACK TRANSACTION;
SELECT * FROM animals;


BEGIN TRANSACTION;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SELECT * FROM animals;

SAVEPOINT sp1;

UPDATE animals
SET weight_kg = weight_kg * -1;

SELECT * FROM animals;

ROLLBACK TO sp1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

SELECT * FROM animals;

COMMIT TRANSACTION;
SELECT * FROM animals;

/* Project 3 */
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 4),
('Jodie Whittaker ', 38);

INSERT INTO species (name)
VALUES
('Digimon'),
('Pokemon');

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon';

/* Project 4 */
INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (species_id, vet_id)
VALUES
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));

INSERT INTO visits (animal_id, vet_id, date)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), 'May 24, 2020'),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'Jul 22, 2020'),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'Feb 2, 2021'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Jan 5, 2020'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Mar 8, 2020'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'May 14, 2020'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'May 4, 2021'),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'Feb 24, 2021'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Dec 21, 2019'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), 'Aug 10, 2020'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Apr 7, 2021'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'Sep 29, 2019'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'Oct 3, 2020'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'Nov 4, 2020'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Jan 24, 2019'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'May 15, 2019'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Feb 27, 2020'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Aug 3, 2020'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'May 24, 2020'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), 'Jan 11, 2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';