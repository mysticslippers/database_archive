---Insert Immersion's values
INSERT INTO immersion(id, risk) VALUES (DEFAULT, random() + 0.0000001);
INSERT INTO immersion(id, risk) VALUES (DEFAULT, random() + 0.0000001);
-------------

---Insert Circle's values
INSERT INTO circle(id, immersion_id, color, mobility) VALUES (DEFAULT, 1, 'black', true);
INSERT INTO circle(id, immersion_id, color, mobility) VALUES (DEFAULT, 1, 'black', true);
INSERT INTO circle(id, immersion_id, color, mobility) VALUES (DEFAULT, 2, 'red', false);
-------------

---Insert Plant's values
INSERT INTO plant(id, specie) VALUES (DEFAULT, 'Осока');
INSERT INTO plant(id, specie) VALUES (DEFAULT, 'Баобаб');
-------------

---Insert Hidden Item's values
INSERT INTO hiddenitem(id, plant_id, name, chanceoffinding) VALUES (DEFAULT, 1, 'Велосипед', random() + 0.000001);
INSERT INTO hiddenitem(id, plant_id, name, chanceoffinding) VALUES (DEFAULT, 1, 'Ракета', random() + 0.000001);
INSERT INTO hiddenitem(id, plant_id, name, chanceoffinding) VALUES (DEFAULT, 2, 'Самолёт', random() + 0.000001);
-------------

---Insert Shelter's values
INSERT INTO shelter(id, name, occupied) VALUES (DEFAULT, 'Болото', true);
INSERT INTO shelter(id, name, occupied) VALUES (DEFAULT, 'Прекрасный замок', true);
-------------

---Insert Monster's values
INSERT INTO monster(id, shelter_id, name, hunger) VALUES (DEFAULT, 2, 'Папич', true);
INSERT INTO monster(id, shelter_id, name, hunger) VALUES (DEFAULT, 1, 'Шрекич', false);
-------------

---Insert Hunter's values
INSERT INTO hunter(id, monster_id, plant_id, name, experience) VALUES (DEFAULT, 1, 1, 'Бобби', random() * 100 + 0.000001);
INSERT INTO hunter(id, monster_id, plant_id, name, experience) VALUES (DEFAULT, 1, 1, 'Дэвид', random() * 100 + 0.000001);
INSERT INTO hunter(id, monster_id, plant_id, name, experience) VALUES (DEFAULT, 2, 2, 'Джамал', random() * 100 + 0.000001);
-------------

---Insert Action's values
INSERT INTO action(immersion_id, monster_id, action, active) VALUES (1, 1, 'ринуться за более крупной добычей', true);
INSERT INTO action(immersion_id, monster_id, action, active) VALUES (1, 2, 'распугивать рыбешку', false);
INSERT INTO action(immersion_id, monster_id, action, active) VALUES (2, 2, 'покинуть свое укрытие', false);
-------------
