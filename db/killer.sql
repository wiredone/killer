CREATE TABLE players (
       id serial4 primary key,
       name VARCHAR(255)
);

CREATE TABLE targets (
       id serial4 primary key,
       name VARCHAR(255),
       player_id INT4 references players(id)

);
