SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

--Day 2
--changing species to unspecified
 BEGIN;
 UPDATE animals SET species='unspecified';
 ROLLBACK;

 --Updating the animal species
 BEGIN;
 UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species='pokemon' WHERE species IS NULL;
 SELECT * FROM animals;
COMMIT;

--deleting Records
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg=weight_kg*-1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT;

--final part
SELECT COUNT(*) AS total_animals FROM animals;
SELECT COUNT(*) AS never_escape FROM animals WHERE escape_attempts=0;
SELECT avg(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS count_escape FROM animals GROUP BY neutered ORDER BY count_escape DESC;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

--Day 3
SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name 
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name, a.name;


SELECT s.name, COUNT(a.id) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;


SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts=0;

SELECT o.full_name, COUNT(a.id) AS animal_count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY COUNT(a.id) DESC
LIMIT 1;

SELECT name AS animal 
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
WHERE date_of_visit = '2021-01-11';

SELECT name AS animal 
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
WHERE vets_id = 3;

SELECT vets.name AS vet, species.name AS species 
FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

 SELECT animals.name AS animal 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 WHERE (vets_id = 3) AND (date_of_visit BETWEEN '2020-04-01' AND '2020-08-30');

 SELECT animals.name AS animal, COUNT(vets_id) AS visits 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 GROUP BY animals.name 
 ORDER BY visits DESC 
 LIMIT 1;

 SELECT name AS animal 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 WHERE date_of_visit = '2020-01-05';

 SELECT animals.name AS animal, vets.name, date_of_visit 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 JOIN vets ON visits.vets_id = vets.id 
 WHERE vets_id = 1 AND date_of_visit = '2021-01-11';

 SELECT COUNT(DISTINCT date_of_visit) AS visits
 FROM visits 
 JOIN animals ON visits.animals_id = animals.id 
 WHERE date_of_visit 
 IN ('2020-05-24', '2020-07-22', '2020-01-05', '2020-03-08', '2020-05-14', '2021-02-24', '2019-12-21', '2020-08-10', '2021-04-07', '2019-01-24', '2019-05-15', '2020-02-27', '2020-08-03');

 SELECT species.name AS specialty 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 JOIN species ON animals.species_id = species.id 
 WHERE animals.id = 9 AND vets_id = 2 
 LIMIT 1;