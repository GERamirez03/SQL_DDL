DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db;


CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    standing INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INTEGER REFERENCES teams
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    season INTEGER REFERENCES seasons,
    match_date DATE NOT NULL,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams,
    winner INTEGER REFERENCES teams CHECK (winner IN (team1, team2)),
    final_score TEXT NOT NULL -- eg '1-0'
);

CREATE TABLE matches_referees (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    referee_id INTEGER REFERENCES referees
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);