/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered, weight_kg) 
VALUES
('Agumon', '2020-02-03', 0, true, 10.23 ),
('Gabumon', '2018-11-15', 2, true, 8 ),
('Pikachu', '2021-01-07', 1, false, 15.04 ),
('Devimon', '2017-05-12', 5, true, 11 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Charmander', '2020-02-08', 0, false, -11),
('Plantnom', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

/* Update species_id for animals with names ending in "mon" to Digimon */

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

/* Update species_id for other animals to Pokemon */

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

/* Update owner_id for animals owned by Sam Smith */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

/* Update owner_id for animals owned by Jennifer Orwell */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

/* Update owner_id for animals owned by Bob */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

/* Update owner_id for animals owned by Melody Pond */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

/* Update owner_id for animals owned by Dean Winchester */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1986-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

/* Insert specialisation data from vets */
INSERT INTO specializations (vet_id, species_id)
VALUES
    ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id
FROM species WHERE name = 'Pokemon')),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id
FROM species WHERE name = 'Digimon')),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id
FROM species WHERE name = 'Pokemon')),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id
FROM species WHERE name = 'Digimon'));

/* Insert visit data */

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
    ((SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'William Tatcher' LIMIT 1), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2020-05-22'),
    ((SELECT id FROM animals WHERE name = 'Gabumon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2021-02-02'),
    ((SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-01-05'),
    ((SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-03-08'),
    ((SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Devimon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Stephenie Mendez' LIMIT 1), '2021-05-24'),
    ((SELECT id FROM animals WHERE name = 'Charmander' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2021-02-24'),
    ((SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2019-12-21'),
    ((SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'William Tatcher' LIMIT 1), '2020-08-10'),
    ((SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2021-04-07'),
    ((SELECT id FROM animals WHERE name = 'Squirtle' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2019-09-29'),
    ((SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2020-10-03'),
    ((SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2020-11-04'),
    ((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2019-01-24'),
    ((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2019-05-15'),
    ((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-02-27'),
    ((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-08-03'),
    ((SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1), (SELECT id
FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1), (SELECT id
FROM vets WHERE name = 'William Tatcher' LIMIT 1), '2021-01-11');
-- Database Performance audit
INSERT INTO visits (animal_id, vet_id, visit_date) 
SELECT animal_ids.id, vets_ids.id, visit_timestamp
FROM (SELECT id FROM animals) animal_ids,
     (SELECT id FROM vets) vets_ids,
     generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
