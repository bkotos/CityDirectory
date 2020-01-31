DROP DATABASE IF EXISTS city_directory;
CREATE DATABASE city_directory;

USE city_directory;

CREATE TABLE state(
    state_id INT(32) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE county(
    county_id INT(32) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    state_id INT(32) NOT NULL,
    FOREIGN KEY (state_id) REFERENCES state(state_id)
);

CREATE TABLE municipality(
    municipality_id INT(32) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    type ENUM('city', 'town', 'village', 'borough', 'township', 'cdp') NOT NULL
);

-- Some municipalities are located within more than one county, so this needs to be a many-to-many relationship.  One
--  prominent example of this is New York City.  Technically, each borough of New York City is its own county.  This
--  means that New York City is located within five counties.
CREATE TABLE county_municipality(
    county_id INT(32) NOT NULL,
    municipality_id INT(32) NOT NULL,
    FOREIGN KEY (county_id) REFERENCES county(county_id),
    FOREIGN KEY (municipality_id) REFERENCES municipality(municipality_id),
    PRIMARY KEY (county_id, municipality_id)
);

-- Some municipalities are located within other municipalities, such as boroughs in Connecticut.  Additionally, this
--  needs to be a many-to-many relationship, as in some states these sub municipalities are actually located within
--  multiple other parent municipalities.  This is the case with the Village of Mamaroneck, which is a New York
--  village located within both the Town of Mamaroneck and Town of Rye.
CREATE TABLE municipality_municipality(
    parent_municipality_id INT(32) NOT NULL,
    child_municipality_id INT(32) NOT NULL,
    FOREIGN KEY (parent_municipality_id) REFERENCES municipality(municipality_id),
    FOREIGN KEY (child_municipality_id) REFERENCES municipality(municipality_id),
    PRIMARY KEY (parent_municipality_id, child_municipality_id)
);

INSERT INTO state
VALUES
    (1, 'Connecticut'),
    (2, 'New York')
;

INSERT INTO county
VALUES
    (1, 'Fairfield', 1),
    (2, 'Westchester', 2),
    (3, 'Bronx', 2),
    (4, 'New York', 2), -- Manhattan
    (5, 'Queens', 2),
    (6, 'Kings', 2), -- Brooklyn
    (7, 'Richmond', 2) -- Staten Island
;

INSERT INTO municipality
VALUES
    (1, 'Fairfield', 'town'),
    (2, 'Newtown', 'town'),
    (3, 'Newtown', 'borough'),

    -- In Connecticut, unlike other states, cities are legally dependent upon their parent town.  Most CT cities are
    --  consolidated with their parent town.  This means that most cities in Connecticut legally exist as a separate
    --  town and city, despite de facto acting as one combined municipality.  That is why CT cities have both a town
    --  clerk and city clerk.
    (4, 'Bridgeport', 'town'),
    (5, 'Bridgeport', 'city'),

    (6, 'Mamaroneck', 'town'),
    (7, 'Rye', 'town'),
    (8, 'Rye Brook', 'village'),
    (9, 'Port Chester', 'village'),

    -- The Vilage of Mamaroneck is part of both the Town of Mamaroneck and the Town of Rye
    (10, 'Mamaroneck', 'village'),

    -- The City of Rye, while bearing the same name as the Town of Rye, is independent.  Unlike in Connecticut, New York
    --  cities exist independent from towns.
    (11, 'Rye', 'city'),
    (12, 'New York', 'city')
;

INSERT INTO county_municipality
VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (2, 6), (2, 7), (2, 8), (2, 9),
    (2, 10), (2, 11), (3, 12), (4, 12), (5, 12), (6, 12), (7, 12)
;

INSERT INTO municipality_municipality
VALUES
    (2, 3), (4, 5), (6, 10), (7, 8), (7, 9), (7, 10)
;