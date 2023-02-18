-- from the terminal run:
-- psql < outer_space.sql

-- NEW SCHEMA: tables are galaxies, centers (of orbit), planets, and moons 

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space



CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE centers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy INTEGER REFERENCES galaxies,
  has_moons BOOLEAN DEFAULT false,
  orbits_around INTEGER REFERENCES centers,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  moon_of INTEGER REFERENCES planets
);

INSERT INTO galaxies (name) VALUES ('Milky Way');

INSERT INTO centers (name) VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO planets
  (name, galaxy, has_moons, orbits_around, orbital_period_in_years)
VALUES
  ('Earth', 1, true, 1, 1.00),
  ('Mars', 1, true, 1, 1.88),
  ('Venus', 1, false, 1, 0.62),
  ('Neptune', 1, true, 1, 164.8),
  ('Proxima Centauri b', 1, false, 2, 0.03),
  ('Gliese 876 b', 1, false, 3, 0.23);

INSERT INTO moons
  (name, moon_of)
VALUES
  ('"The Moon"', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('"S/2004 N 1"', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);