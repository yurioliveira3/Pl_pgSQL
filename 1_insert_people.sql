-- INSERT A PEOPLE
DROP FUNCTION IF EXISTS insert_people;
CREATE OR REPLACE FUNCTION insert_people(peo_name TEXT) RETURNS VOID AS $$
	BEGIN 
		INSERT INTO people("name") VALUES (peo_name);
	END
$$ LANGUAGE plpgsql;
