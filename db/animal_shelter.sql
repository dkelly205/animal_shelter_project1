
DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE customers;

CREATE TABLE customers
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
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  gender VARCHAR(255),
  health INT,
  admission_date DATE,
  image VARCHAR(255),
  adoptable BOOLEAN,
  age INT
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  animal_id INT8 references animals(id) ON DELETE CASCADE,
  customer_id INT8 references customers(id) ON DELETE CASCADE
);
