---Create additional function for main task
CREATE FUNCTION count_of_plants(nameOfSpecie varchar(40))
    RETURNS integer AS $$
    DECLARE
        countOfPlants integer = 0;
        string Plant%rowtype;
    BEGIN
        FOR string IN SELECT * FROM Plant
        LOOP
            IF string.specie = nameOfSpecie THEN
                countOfPlants = countOfPlants + 1;
            END IF;
            EXIT WHEN countOfPlants > 1;
        END LOOP;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Нет растений вида: %.', $1;
        END IF;
        RETURN countOfPlants;
    END;
    $$
LANGUAGE PLPGSQL;

---Create main function for main task
CREATE FUNCTION specie_insert_redBook()
    RETURNS void AS $$
    DECLARE
        string Plant%rowtype;
    BEGIN
        FOR string IN SELECT * FROM Plant
        LOOP
            BEGIN
            IF count_of_plants(string.specie) = 1 THEN
                INSERT INTO redbook(plant_id, plant_specie) VALUES (string.id, string.specie);
            END IF;
            EXCEPTION WHEN check_violation THEN
                RAISE NOTICE '% уже есть в красной книге!', string.specie;
            END;
        END LOOP;
    END;
    $$
LANGUAGE PLPGSQL;