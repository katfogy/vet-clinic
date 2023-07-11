/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic; 
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL(10,2),
    PRIMARY KEY(id));

--Day two
ALTER TABLE animals ADD COLUMN species TEXT;