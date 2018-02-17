DROP TABLE owners;
DROP TABLE animals;


CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  breed VARCHAR(255),
  health INT,
  admission_date TIMESTAMP,
  adoptable BOOLEAN
);

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255),
  phone_number VARCHAR(255) not null,
  animal_id INT REFERENCES animals(id) ON DELETE CASCADE
);
