DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    pref_region INTEGER REFERENCES regions
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    title TEXT UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user INTEGER REFERENCES users,
    region INTEGER REFERENCES regions,
    category INTEGER REFERENCES categories,
    location TEXT NOT NULL,
    title TEXT NOT NULL,
    post TEXT NOT NULL
);