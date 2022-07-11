/*Queries that provide answers to the questions from all projects.*/

/* Porject 1 */
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE escape_attempts < 3 AND neutered = true;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Porject 2 */
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Porject 3 */
SELECT name, full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT *
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT COUNT(*), species.name
FROM species
JOIN animals ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name, owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';


SELECT COUNT(*) AS animals_count, owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animals_count DESC;

/* Porject 4 */

SELECT visits.date, animals.name
FROM visits
JOIN animals ON visits.animal_id = animals.id
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
ORDER BY date DESC
LIMIT 1;

SELECT COUNT(DISTINCT animal_id)
FROM visits
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

SELECT vets.name, specializations.species_id, species.name
FROM vets
FULL JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON species.id = specializations.species_id;

SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez') AND visits.date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT COUNT(visits.animal_id) AS animals_count, animals.name
FROM visits
JOIN animals ON visits.animal_id = animals.id
GROUP by animals.name
ORDER BY animals_count DESC
LIMIT 1;

SELECT date, animals.name
FROM visits
JOIN animals ON visits.animal_id = animals.id
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
ORDER BY date ASC
LIMIT 1;

SELECT animals.*, vets.*, visits.date
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.date DESC
LIMIT 1;

SELECT count(*) as visits_with_different_specialty
FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
WHERE animals.species_id NOT IN (
   SELECT coalesce(specializations.species_id, 3)
   FROM vets
   LEFT JOIN specializations ON specializations.vet_id = vets.id
   WHERE vets.id = visits.vet_id
);

SELECT count(species.name), species.name
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY count(species.name) DESC
LIMIT 1;


SELECT COUNT(*) FROM visits WHERE animal_id = 4;

SELECT * FROM visits where vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';