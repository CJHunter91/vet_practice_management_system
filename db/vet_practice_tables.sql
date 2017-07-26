DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS appointment_times;
DROP TABLE IF EXISTS calendar;

SET datestyle = "SQL, DMY";

CREATE TABLE appointment_times(
  id SERIAL4 PRIMARY KEY,
  available_time TIME
);

CREATE TABLE calendar(
  id DATE PRIMARY KEY,
  year INT2 NOT NULL,
  month INT2 NOT NULL,
  day INT2 NOT NULL,
  quarter INT2 NOT NULL,
  day_of_week INT2 NOT NULL,
  day_of_year INT2 NOT NULL,
  week_of_year INT2 NOT NULL,
  CONSTRAINT valid_month CHECK (month >= 1 AND month <= 12), 
  CONSTRAINT valid_day_of_year CHECK (day_of_year >= 1 AND day_of_year <= 366),
  CONSTRAINT valid_week_of_year CHECK(week_of_year >= 1 AND week_of_year <= 53)
);

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  postcode VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  age VARCHAR(255), 
  type VARCHAR(255),
  breed VARCHAR(255),
  sex VARCHAR(255),
  owner_id INT4 REFERENCES owners (id) ON DELETE CASCADE
);

CREATE TABLE appointments(
  id SERIAL4 PRIMARY KEY,
  appointment_time_id INT4 REFERENCES appointment_times (id), 
  duration INT4, 
  needs_seen BOOLEAN,
  reason TEXT,
  arrival TIME,
  pet_id INT4 REFERENCES pets (id) ON DELETE CASCADE
);

-- populate calendar using PG

INSERT INTO calendar (id, year, month, day, quarter, day_of_week, day_of_year, week_of_year)
(SELECT ts,
  EXTRACT (YEAR FROM ts),
  EXTRACT (MONTH FROM ts),
  EXTRACT (DAY FROM ts),
  EXTRACT (QUARTER FROM ts),
  EXTRACT (DOW FROM ts),
  EXTRACT (DOY FROM ts),
  EXTRACT (WEEK FROM ts)
  FROM generate_series(TIMESTAMP '2016-01-01', TIMESTAMP '2020-01-01', '1 day') AS ts)
