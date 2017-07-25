DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

SET datestyle = "ISO, DMY";

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  age DATE, 
  type VARCHAR(255),
  breed VARCHAR(255),
  sex VARCHAR(255),
  owner_id INT4 REFERENCES owners (id) ON DELETE CASCADE
);

CREATE TABLE appointments(
  id SERIAL4 PRIMARY KEY,
  appointment_time TIME,
  duration INT4, 
  needs_seen BOOLEAN,
  reason TEXT,
  pet_id INT4 REFERENCES pets (id) ON DELETE CASCADE
);
