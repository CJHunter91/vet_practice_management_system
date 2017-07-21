DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE pets(

);

CREATE TABLE appointments(

);
