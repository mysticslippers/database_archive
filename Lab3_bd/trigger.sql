---Create trigger function for additional task
CREATE FUNCTION monster_insert_trigger_function()
    RETURNS trigger AS
    $$
    BEGIN
        IF New.name ~* '\w*(шрек[а-яА-Я]*)+\w*' THEN
            INSERT INTO shrekfriends(friend_id, shrek_id, name) VALUES (DEFAULT, NEW.id, 'подружка ' || to_char(NEW.id, '999th') || ' Шрека');
        END IF;
        RETURN NEW;
    END;
    $$
LANGUAGE plpgsql;

---Create trigger for function
CREATE TRIGGER tr_insert_into_monster
    AFTER INSERT OR UPDATE ON monster
    FOR EACH ROW EXECUTE PROCEDURE monster_insert_trigger_function();
