CREATE TABLE IF NOT EXISTS Immersion(
    id SERIAL NOT NULL PRIMARY KEY,
    risk DOUBLE PRECISION NOT NULL CONSTRAINT admissibleRisk CHECK (risk BETWEEN 0.0 AND 1.0)
);

CREATE TABLE IF NOT EXISTS Circle(
    id  SERIAL NOT NULL PRIMARY KEY,
    immersion_id INTEGER NOT NULL REFERENCES Immersion(id) ON DELETE RESTRICT,
    color VARCHAR(60) NOT NULL,
    mobility BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Plant(
    id SERIAL NOT NULL PRIMARY KEY,
    specie TEXT NOT NULL CONSTRAINT readableSpecie CHECK (char_length(specie) < 40)
);

CREATE TABLE IF NOT EXISTS HiddenItem(
    id SERIAL NOT NULL PRIMARY KEY,
    plant_id INTEGER NOT NULL REFERENCES Plant(id) ON DELETE RESTRICT,
    name TEXT NOT NULL UNIQUE CONSTRAINT readableName CHECK (char_length(name) < 30),
    chanceOfFinding DOUBLE PRECISION NOT NULL CONSTRAINT possibleChanceOfFinding CHECK (chanceOfFinding > 0.0)
);

CREATE TABLE IF NOT EXISTS Shelter(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL CONSTRAINT readableName CHECK (char_length(name) < 30),
    occupied BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Monster(
    id SERIAL NOT NULL PRIMARY KEY,
    shelter_id INTEGER NOT NULL REFERENCES Shelter(id) ON DELETE RESTRICT,
    name TEXT NOT NULL UNIQUE CONSTRAINT readableName CHECK (char_length(name) < 40),
    hunger BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Hunter(
    id SERIAL NOT NULL PRIMARY KEY,
    monster_id INTEGER NOT NULL REFERENCES Monster(id) ON DELETE RESTRICT,
    plant_id INTEGER NOT NULL REFERENCES Plant(id) ON DELETE RESTRICT,
    name TEXT NOT NULL CONSTRAINT readableName CHECK (char_length(name) < 30),
    experience DOUBLE PRECISION NOT NULL
);

CREATE TYPE Actions AS ENUM ('покинуть свое укрытие',
    'распугивать рыбешку',
    'ринуться за более крупной добычей');

CREATE TABLE IF NOT EXISTS Action(
    immersion_id INTEGER NOT NULL REFERENCES Immersion(id) ON DELETE CASCADE,
    monster_id INTEGER NOT NULL REFERENCES Monster(id) ON DELETE CASCADE,
    action Actions NOT NULL,
    active BOOLEAN NOT NULL
);

---Create additional table for trigger
CREATE TABLE IF NOT EXISTS ShrekFriends(
    friend_id SERIAL NOT NULL PRIMARY KEY,
    shrek_id INTEGER NOT NULL REFERENCES Monster(id) ON DELETE RESTRICT,
    name varchar(60) NOT NULL UNIQUE
);

---Create additional table for function
CREATE TABLE IF NOT EXISTS RedBook(
    plant_id INTEGER NOT NULL PRIMARY KEY REFERENCES Plant(id) ON DELETE RESTRICT,
    plant_specie varchar(40) NOT NULL UNIQUE
);