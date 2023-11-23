/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* update the animals table by setting the species column to unspecified */
begin;
update animals set species = 'unspecified';
select * from aniamls;
rollback;
select * from animals;

update animals set species = 'digimon'
where name like '%mon';
select * from animals;

/* Update the animals table, setting the species column to 'pokemon' for rows where species is not already set*/
update animals set species = 'pokemon'
where species is null;
select * from animals;
commit;
select * from animals;

/* delete all records in the animals table, then roll back the transaction. */
begin;
delete from animals;
select * from animals;
rollback;
select * from animals;

/* Delete all animals born after Jan 1st, 2022. */
begin; 
delete from animals where date_of_birth > '2022-01-01';
savepoint my_savepoint;

/* Update all animals' weight to be their weight multiplied by -1. */
update animals set weight_kg = weight_kg * -1;
rollback to savepoint my_savepoint;

/* Update all animals' weights that are negative to be their weight multiplied by -1. */
update animals set weight_kg = weight_kg * -1
where weight_kg < 0;
commit;

select * from animals;

/* How many animals are there? */
select count(*) as total_animals from animals;

/* How many animals have never tried to escape? */
select count(*) as animals_never_tried_to_escape
from animals
where escape_attempts = 0;

/* What is the average weight of animals? */
select avg(weight_kg) as average_weight 
from animals;

/* Who escapes the most, neutered or not neutered animals? */
select neutered, count(*) as escape_count
from animals
where escape_attempts > 0
group by neutered;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
