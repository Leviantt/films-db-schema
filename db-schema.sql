-- CREATE DATABASE films;


CREATE TABLE person
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE genre
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE film 
(
    id SERIAL PRIMARY KEY,
    audio_tracks TEXT,
    subtitles TEXT,
    video_quality TEXT,
    production_year INTEGER,
    genre_id INTEGER NOT NULL REFERENCES genre(id),
    slogan TEXT,
    director_id INTEGER NOT NULL REFERENCES person(id),
    scenario_author_id INTEGER NOT NULL REFERENCES person(id),
    producer_id INTEGER NOT NULL REFERENCES person(id),
    operator_id INTEGER NOT NULL REFERENCES person(id),
    composer_id INTEGER NOT NULL REFERENCES person(id),
    artist_id INTEGER NOT NULL REFERENCES person(id),
    editor_id INTEGER NOT NULL REFERENCES person(id),
    budget MONEY,
    marketing MONEY,
    us_box_office MONEY,
    world_box_office MONEY,
    russia_release_date DATE,
    world_release_date DATE,
    dvd_release_date DATE,
    age SMALLINT,
    mpaa_rating VARCHAR(10),
    time_in_minutes SMALLINT
);

CREATE TABLE viewer
(
    id SERIAL PRIMARY KEY,
    country_name TEXT NOT NULL UNIQUE,
    views_amount BIGINT,
    film_id INTEGER REFERENCES film(id)
);

CREATE TABLE film_person
(
    id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES film(id),
    person_id INTEGER REFERENCES person(id),
    is_original_actor BOOLEAN,
    UNIQUE(film_id, person_id)
);