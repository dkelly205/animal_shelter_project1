DROP TABLE adopted_animals;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  phone_number VARCHAR(255)
);


CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  breed VARCHAR(255),
  gender VARCHAR(255),
  health INT,
  admission_date DATE,
  image VARCHAR(255),
  adoptable BOOLEAN
  -- owner_id INT REFERENCES owners(id) ON DELETE CASCADE
);

CREATE TABLE adopted_animals
(
  id SERIAL8 primary key,
  animal_id INT8 references animals(id),
  owner_id INT8 references owners(id)
);
