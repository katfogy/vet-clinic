/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.00);

--Day two Task
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Charmander','2020-02-08',0,false,11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Plantmon','2021-11-15',2,true,5.70);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Squirtle','1993-04-02',3,false,12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Angemon','2005-06-12',1,true,45.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Boarmon','2005-06-07',7,true,20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Blossom','1998-10-13',3,true,17.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)VALUES('Ditto','2022-05-14',4,true,22.00);

--Day 3
INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

UPDATE animals a
SET species_id = s.id
FROM species s
WHERE (a.name LIKE '%mon' AND s.name = 'Digimon')
   OR (a.name NOT LIKE '%mon' AND s.name = 'Pokemon');

UPDATE animals a
SET owner_id = o.id
FROM owners o
WHERE o.full_name IN ('Sam Smith', 'Jennifer Orwell', 'Bob', 'Melody Pond', 'Dean Winchester')
  AND (
    (a.name = 'Agumon' AND o.full_name = 'Sam Smith')
    OR (a.name IN ('Gabumon', 'Pikachu') AND o.full_name = 'Jennifer Orwell')
    OR (a.name IN ('Devimon', 'Plantmon') AND o.full_name = 'Bob')
    OR (a.name IN ('Charmander', 'Squirtle', 'Blossom') AND o.full_name = 'Melody Pond')
    OR (a.name IN ('Angemon', 'Boarmon') AND o.full_name = 'Dean Winchester')
  );

  --Day 4
  INSERT INTO vets
(name, age, date_of_graduation) 
VALUES('William Tatcher', 45, '2000-04-23'), 
('Maisy Smith', 26, '2019-01-17'), 
('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');

-- Insert into specializations
INSERT INTO specializations (species_id, vet_id) 
VALUES(1,1), (2,3), (1,3), (2,4);

-- Insert into visits
INSERT INTO visits (animals_id, vets_id, date_of_visit) 
VALUES (1, 1, '2020-05-24'), (1, 3, '2020-07-22'), (2, 4, '2021-02-02'), (3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'), (4, 3, '2021-05-04'),(5, 4, '2021-02-24'), (6, 2, '2019-12-21'), (6, 1, '2020-08-10'), (6, 2, '2021-04-07'), (7, 3, '2019-09-29'), (8, 4, '2020-10-03'), (8, 4, '2020-11-04'), (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), (9, 2, '2020-02-27'), (9, 2, '2020-08-03'), (10, 3, '2020-05-24'), (10, 1, '2021-01-11');