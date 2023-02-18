-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- Updated schema: table of customers, table of flights, and table of customers' seats on those flights

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers,
  flight_id INTEGER REFERENCES flights,
  seat TEXT NOT NULL
);

INSERT INTO customers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO flights
  (airline, from_city, from_country, to_city, to_country, departure, arrival)
VALUES
  ('United', 'Washington DC', 'United States', 'Seattle', 'United States', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States', '2018-01-02 07:00:00', '2018-01-02 08:03:00')
  ('Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('Air China', 'Dubai', 'UAE', 'Beijing', 'China', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('United', 'New York', 'United States', 'Charlotte', 'United States', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile', '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO seats
  (customer_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D');



-- REFERENCE: Original Schema and Data:

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');