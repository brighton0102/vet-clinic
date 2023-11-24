/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL(10,2)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

/* Drop the existing primary key constraint on id */
ALTER TABLE animals DROP CONSTRAINT animals_pkey;

/* Add a new auto-incremented primary key constraint to id */
ALTER TABLE animals ADD PRIMARY KEY (id);

/* Remove the existing column species */
alter table animals drop column species;

/* Add a new column species_id as a foreign key referencing the species table */

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
    FOREIGN KEY (species_id)
    REFERENCES species(id);

/* Add a new column owner_id as a foreign key referencing the owners table */

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owner
    FOREIGN KEY (owner_id)
    REFERENCES owners(id);

