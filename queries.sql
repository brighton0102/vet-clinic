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
begin;
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

/* What animals belong to Melody Pond? */
SELECT animals.name as animals_name
    FROM animals
    JOIN owners on animals.owner_id = owners.id
    WHERE owners.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */
SELECT animals.name as animal_name, species.name as type
    FROM animals
    JOIN species on animals.species_id = species.id
    WHERE species.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT owners.full_name AS owner_name, animals.name AS animal_name
    FROM owners
    LEFT JOIN animals ON owners.id = animals.owner_idz
    ORDER BY owners.full_name;

/* How many animals are there per species? */
SELECT s.name AS species_name, COUNT(a.id) AS animal_count
    FROM species s
    LEFT JOIN animals a ON s.id = a.species_id
    GROUP BY s.name
    ORDER BY s.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT animals.name as animal_name,species.name as type, owners.full_name as owner_id
    FROM animals
    inner join species on animals.species_id = species.id
    inner join owners on animals.owner_id = owners.id
    where species.name = 'Digimon' and owners.full_name = 'Jennifer Orwell'

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT animals.name as animal_name
    FROM animals
    inner join owners on animals.owner_id = owners.id
    where owners.full_name = 'Dean Winchester' and animals.escape_attempts < 1;

/* Who owns the most animals? */
SELECT owners.full_name AS owner_name, COUNT(animals.id) AS animal_count
    FROM owners
    LEFT JOIN animals ON owners.id = animals.owner_id
    GROUP BY owners.full_name
    ORDER BY animal_count DESC
    LIMIT 1;